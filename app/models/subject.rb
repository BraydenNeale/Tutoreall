class Subject < ActiveRecord::Base
	validates :name, presence: true
	validates :faculty, presence: true
	validates :group, presence: true
	has_and_belongs_to_many :tutors

  def display_name
    return "#{self.name}".titleize
  end
end
