class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :card, :as => :user

  acts_as_messageable

  def display_name
    return "#{self.firstname} #{self.lastname}"
  end

  def mailboxer_email(object)
 		#return the model's email here
	end
end
