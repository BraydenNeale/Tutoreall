class Area < ActiveRecord::Base
		validates :name, presence: true, uniqueness: true
		validates :code, presence: true, uniqueness: true

    geocoded_by :get_gmap_address
    after_validation :geocode

	def display_name
    return "#{self.name}".titleize
  end

  def get_gmap_address
    return "#{self.name}, #{self.state}"
  end
end