module TutorHelper
	# def area_options
	# 	s = ''
	# 	if is_tutor
	# 		Student.all.each do |user|
	# 			s << "<option value='#{user.id}'>#{user.display_name}</option>"
	# 		end
	# 	else
	# 		Tutor.all.each do |user|
	# 			s << "<option value='#{user.id}'>#{user.display_name}</option>"
	# 		end
	# 	end
	# 	s.html_safe
	# end

	def subjects_options
		s = ''
		s << "<option value=''>Select Subject</option>"
		Subject.all.each do |subject|
			s << "<option value='#{subject.name}'>#{subject.name}</option>"
		end
		s.html_safe
	end
end
