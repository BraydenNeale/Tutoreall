class Tutor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :card, :as => :user

  mount_uploader :picture, PictureUploader

  acts_as_messageable # mailboxer

  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :areas

 # 	def self.search(search)
 # 		where("name like ?", "%#{search}%")
	# end

	# def self.search(field, term)
	# 	where("? like ?", "%#{field}", "%#{term}")
	# end

  def display_name
    return "#{self.firstname} #{self.lastname}".titleize
  end

  def display_rate
    return helper.number_to_currency(self.rate)
  end

  def mailboxer_email(object)
    #return the model's email here
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
    # where("firstname like ?", "%#{area}%")
  end

  def helper
    ActionController::Base.helpers
  end
end
