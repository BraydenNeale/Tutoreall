module MessagesHelper
	def recipients_options
		# User.all.each do |user|
		# 	s << "<option value='#{user.id}'>#{user.name}</option>"
		# end
		# s.html_safe
		s = ''
		Tutor.all.each do |user|
			s << "<option value='#{user.id}'>#{user.display_name}</option>"
		end
		s.html_safe
	end
end
