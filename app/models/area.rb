class Area < ActiveRecord::Base
		validates :name, presence: true, uniqueness: true
		validates :code, presence: true, uniqueness: true

    geocoded_by :name
    after_validation :geocode

	def display_name
    return "#{self.name}".titleize
  end
end