class Subject < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	validates :code, presence: true, uniqueness: true
	has_and_belongs_to_many :tutors

	def display_name
    return "#{self.name}".titleize
  end
end
