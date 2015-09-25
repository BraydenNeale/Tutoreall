class Tutor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 # 	def self.search(search)
 # 		where("name like ?", "%#{search}%")
	# end

	# def self.search(field, term)
	# 	where("? like ?", "%#{field}", "%#{term}")
	# end
end
