class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :card, :as => :user
  has_many :lessons

  acts_as_messageable

   validate :uniqueness_of_user_email


  def uniqueness_of_user_email
    Tutor.all.each do |tutor|
      if(tutor.email == self.email)
        errors.add(:field, " - Tutor account exists with that email address")
      end
    end
  end

  def display_name
    return "#{self.firstname} #{self.lastname}".titleize
  end

  def mailboxer_email(object)
 		#return the model's email here
	end
end
