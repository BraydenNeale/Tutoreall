class Tutor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :card, :as => :user

  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :areas

 # 	def self.search(search)
 # 		where("name like ?", "%#{search}%")
	# end

	# def self.search(field, term)
	# 	where("? like ?", "%#{field}", "%#{term}")
	# end
end
