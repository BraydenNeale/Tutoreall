class Tutor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :firstname, presence: true, length: { in: 2..35 }
  validates :lastname, presence: true, length: { in: 2..35 }
  validates :about, length: { maximum: 3000 }
  validates :rate, presence: true, numericality: true
  validates :experience, length: { maximum: 3000 }

  serialize :availability

  mount_uploader :picture, PictureUploader

  acts_as_messageable # mailboxer

  has_one :bank_account, dependent: :destroy, as: :provider
  accepts_nested_attributes_for :bank_account, allow_destroy: true
  has_one :wwc_card, dependent: :destroy
  accepts_nested_attributes_for :wwc_card, allow_destroy: true
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :areas
  has_and_belongs_to_many :organisations

  has_many :lessons, dependent: :destroy
  validate :uniqueness_of_user_email

  enum sex: ['Female','Male']
  @@tutorial_academy_fee = 5 # we take a fixed price of $5

  def uniqueness_of_user_email
    Student.all.each do |student|
      if(student.email == self.email)
        errors.add(:field, "- Student account exists with that email address")
      end
    end
  end

  def self.get_tutorial_academy_fee
    # can't use defined helper :(
    ActionController::Base.helpers.number_to_currency(@@tutorial_academy_fee)
  end

  def display_name
    return "#{self.firstname} #{self.lastname}".titleize
  end

  def display_rate
    return helper.number_to_currency(self.rate)
  end

  def rate_with_organisation_fees
    cost = self.rate
    cost += @@tutorial_academy_fee
    self.organisations.each do |org|
      cost += org.fee
    end

    return helper.number_to_currency(cost)
  end

  def display_suburb
    return "#{self.suburb.titleize}, WA" if self.suburb.present?

    return ""
  end

  # if you want message updates to notify them in email
  def mailboxer_email(object)
    #return the model's email here
    return self.email
  end

  def name
    return display_name
  end

  def has_valid_wwc_card?
    return verify_wwc_card(self.wwc_card)
  end

  def hash_tag_list
    return self.subjects.map(&:faculty).uniq.take(2)
  end

  def get_age
    if self.date_of_birth.nil?
      return nil
    end

    now = Time.now.utc.to_date
    dob = self.date_of_birth
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def is_get_ahead_tutor?
    get_ahead_tutoring = Organisation.all.where(name: "Get Ahead Tutoring").first

    self.organisations.each do |org|
      if org.id == get_ahead_tutoring.id
        return true
      end
    end

    return false
  end

  def self.featured_tutors
    # return self.all.order("RANDOM()").limit(8)
    return self.all.where(verified: true).order("RANDOM()").limit(8)
  end

  def self.similar_tutors(tutor)
    # Some similariy algorithm here to return the 2 closes tutors - same subjects/area...
    return self.all.where.not(id: tutor.id).where(verified: true).order("RANDOM()").limit(2)
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

  private

  def verify_wwc_card(wwc)
    if not wwc.present?
      return false
    end

    # WWC num is 6 chars long
    if wwc.number.length != 6
      # errors.add :base, 'Number not correct format'
      return false
    end

    # WWC num is all digits
    if !/\A\d+\z/.match(wwc.number) # if not a positive number
      # errors.add :base, 'Number not correct format'
      return false
    end

    # if card has expired
    if(wwc.expiry <= Date.today)
      # errors.add :base, "Card has expired"
      return false
    end

    # complex selenium script or compare with webscraped data 
    # to determine if is valid according to www.checkwwc.wa.gov.au/
    return true
  end
end
