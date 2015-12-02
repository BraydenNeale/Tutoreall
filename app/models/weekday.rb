class Weekday < ActiveRecord::Base
	
	has_and_belongs_to_many :tutors

	# Indexed for Date::DAYNAMES
	# 0 - sunday
	# 1 - monday
	# 2 - tuesday
	# 3 - wednesday
	# 4 - thursday
	# 5 - friday
	# 6 - saturday
	
	def get_day
		return Date::DAYNAMES[self.day]
	end
end
