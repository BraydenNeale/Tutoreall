module MessagesHelper
	def recipients_options
		# User.all.each do |user|
		# 	s << "<option value='#{user.id}'>#{user.name}</option>"
		# end
		# s.html_safe
		s = ''

		# if is_tutor?
		# if current_user.is_a? Tutor
		# if is_tutor
		# 	Student.all.each do |user|
		# 		s << "<option value='#{user.id}'>#{user.display_name}</option>"
		# 	end
		# else
		# 	Tutor.all.each do |user|
		# 		s << "<option value='#{user.id}'>#{user.display_name}</option>"
		# 	end
		# end
		# s.html_safe

		Student.all.each do |user|
			s << "<option value='#{user.id}'>#{user.display_name}</option>"
		end
		s.html_safe
	end
end
