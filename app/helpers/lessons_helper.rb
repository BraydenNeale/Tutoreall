module LessonsHelper

	def my_approval
		# switch on state 
		if (@lesson.tutor_change and is_student) or (not @lesson.tutor_change and is_tutor)
			return true
		else
			return false
		end
	end

	def lesson_edited_by
		if @lesson.tutor_change
			return "last edit was by #{@lesson.tutor.display_name} on "
	  else	
	 		return "last edit was by #{@lesson.student.display_name} on "
	 	end
	end

	def lesson_updated
		return local_time(@lesson.updated_at.strftime('%d/%m/%Y %H:%M'))
	end

	# Refactor this + next_student into one method
	def next_tutor_lesson(student, tutor)
		tutor.lessons.order(date: :desc).each do |lesson|
			if(lesson.student.id = student.id && lesson.date >= DateTime.now)
				return lesson
			end
		end

		return nil
	end

	def next_student_lesson(student, tutor)
		# return student.lessons.order(date: :asc).where(lesson.student)
		student.lessons.order(date: :desc).each do |lesson|
			if(lesson.tutor.id = tutor.id && lesson.date >= DateTime.now)
				return lesson
			end
		end

		return nil
	end

	def next_lesson_date(lesson)
		if lesson.present?
			return local_time(lesson.date, '%d/%m/%Y %I:%M%p')
		end

		return "Not scheduled"
	end

	def next_lesson_faculty(lesson)
		if lesson.present?
			return "##{lesson.subject}"
		end

		return ""
	end
end
