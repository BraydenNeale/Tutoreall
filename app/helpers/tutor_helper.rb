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
		s << "<option value=nil>Select Subject</option>"
		Subject.all.each do |subject|
			s << "<option value='#{subject.name}'>#{subject.display_name}</option>"
		end
		s.html_safe
	end

	def subjects_list(tutor)
		s = ''
		s << "<option value=nil>Select Subject</option>"
		tutor.subjects.all.each do |subject|
			s << "<option value='#{subject.name}'>#{subject.display_name}</option>"
		end
		s.html_safe
	end

	def subjects_faculties
		s = ''
		s << "<option value=''>Select Subject</option>"
		Subject.uniq.pluck(:faculty).each do |faculty|
			s << "<option value='#{faculty}'>#{faculty}</option>"
		end
		s.html_safe
	end

	def show_subjects(subjects)
		subjects.collect(&:name).join(", ").titleize
	end

	def show_areas(areas)
		areas.collect(&:name).join(", ").titleize
	end

	def show_availability(days)
		days.collect{|x| Date::DAYNAMES[x.to_i]}.join(", ").titleize
	end
end
