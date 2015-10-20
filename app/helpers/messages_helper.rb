module MessagesHelper
	def recipient_options
		User.all.each do |user|
			s << "<option value='#{user.id}'>#{user.name}</option>"
		end
		s.html_safe
	end
end
