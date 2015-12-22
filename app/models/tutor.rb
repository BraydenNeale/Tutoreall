class Tutor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  mount_uploader :picture, PictureUploader

  acts_as_messageable # mailboxer

  has_one :wwc_card, dependent: :destroy
  accepts_nested_attributes_for :wwc_card, :allow_destroy => true
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :areas
  # maybe better as an enum...
  has_and_belongs_to_many :weekdays

  has_many :lessons, dependent: :destroy

  validate :uniqueness_of_user_email


  def uniqueness_of_user_email
    Student.all.each do |student|
      if(student.email == self.email)
        errors.add(:field, "- Student account exists with that email address")
      end
    end
  end


  def display_name
    return "#{self.firstname} #{self.lastname}".titleize
  end

  def display_rate
    return helper.number_to_currency(self.rate)
  end

  # if you want message updates to notify them in email
  def mailboxer_email(object)
    #return the model's email here
  end

  def hash_tag_list
    return self.subjects.map(&:faculty).uniq.take(3)
  end

  def get_age
    if self.date_of_birth.nil?
      return nil
    end

    now = Time.now.utc.to_date
    dob = self.date_of_birth
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def self.searchSubject(subject)
    sub = Subject.where("name like ?", "%#{subject}%").first
    includes(:subjects).where('subjects.id' => sub.id)
  end

  def self.searchArea(area)
    ar = Area.where("name like ?", "%#{area}%").first

    if ar.present?
      includes(:areas).where('areas.id' => ar.id)
    else
      return Array.new
    end
  end

  def self.search(area, subject)
    ar = Area.where("lower(name) like ?", "%#{area.downcase}%").first 
    sub = Subject.where("name like ?", "%#{subject}%").first

    if ar.present?
      tutors = includes(:areas).where('areas.id' => ar.id)
      if sub.present?
        return tutors.includes(:subjects).where('subjects.id' => sub.id)
      else
        return tutors
      end
    elsif sub.present?
      includes(:subjects).where('subjects.id' => sub.id)
    else
      return Array.new
    end
  end

  # area still messed up - need to fix
  def self.simple_search(area, faculty)
    if(area.present?)
      ar = Area.where("lower(name) like ?", "%#{area.downcase}%").first
    end
    
    subs = Subject.where("faculty like ?", "#{faculty.downcase}")

    if(subs.present?)
      tutors = self.joins(:subjects).where(subjects: { id: subs.ids }).distinct

      if ar.present?
        return tutors.includes(:areas).where('areas.id' => ar.id)
      end

      return tutors
    end

    if(ar.present?)
      return self.includes(:areas).where('areas.id' => ar.id)
    end

    return Array.new
  end

  def helper
    ActionController::Base.helpers
  end
end
