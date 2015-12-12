module LessonsHelper

	#Lesson status states
	# initial - lesson was just created (student has not approved)
	# edited - lesson details updated by student or tutor (not approved by other party)
	# approved - lesson accepted with current details
	# completed - lesson has completed (assume everything was fine and process payment)
	# cancelled - lesson was cancelled
	# problem - discrepancy (tutor or student not happy after lesson date)
	# requested - student requested lesson
	# braintree payment - 

	# Look into state machine gem for this
	def status_helper
		if @lesson.status == "approved"
			return "Lesson was approved on "
		elsif @lesson.status == "completed"
			return "Lesson completed on "
		elsif @lesson.status == "cancelled"
			return "Lesson cancelled on "
		elsif @lesson.status == "problem"
			return "Someone didn't get payed for some reason" 
		elsif @lesson.status == "edited"
			return lesson_edited_by
		elsif @lesson.status == "initial"
			return "lesson created on: "
		elsif @lesson.status == "braintree"
			return "Lesson payed for through braintree"
		end
	end

	def my_approval
		# if(@lesson.status == "approved" || @lesson.status == "cancelled" || @lesson.status == "completed")
		if(not(@lesson.status == "edited" || @lesson.status == "initial"))
			return false
		end

		if (@lesson.tutor_change and is_student) or (not @lesson.tutor_change and is_tutor)
			return true
		else
			return false
		end
	end

	def lesson_edited_by
		# localtime string concat doesn't work
		# e.g. last edit was by #{@lesson.tutor.display_name} on " + local_time(@lesson.updated_at.strftime('%d/%m/%Y %H:%M'))
		if @lesson.tutor_change
			return "last edit was by #{@lesson.tutor.display_name} on "
	  else	
	 		return "last edit was by #{@lesson.student.display_name} on "
	 	end
	end

	def lesson_updated
		return local_time(@lesson.updated_at.strftime('%d/%m/%Y %H:%M'))
	end

	def is_cancelled
		return (@lesson.status == "cancelled")
	end
end
