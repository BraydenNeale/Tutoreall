module LessonsHelper

	#Lesson status states
	# initial - lesson was just created (student has not approved)
	# edited - lesson details updated by student or tutor (not approved by other party)
	# approved - lesson accepted with current details
	# completed - lesson has completed (assume everything was fine and process payment)
	# cancelled - lesson was cancelled
	# problem - discrepancy (tutor or student not happy after lesson date)

	# Look into state machine gem for this
	def status_helper
		if @lesson.status == "approved"
			return "Peeps be happy with these conditions"
		elsif @lesson.status == "completed"
			return "Lesson is completed"
		elsif @lesson.status == "cancelled"
			return "Lesson cancelled"
		elsif @lesson.status == "problem"
			return "Someone didn't get payed for some reason" 
		else
			return our_approval
		end
	end

	def our_approval
		if (@lesson.tutor_change and is_student) or (not @lesson.tutor_change and is_tutor)
			return link_to "Approve", root_path
		else
			return "Waiting for approval"
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
		updated = local_time(@lesson.updated_at.strftime('%d/%m/%Y %H:%M'))
		# if @lesson.tutor_change
		# 	# return "last edit was by #{@lesson.tutor.display_name} on " + updated.to_s
		# 	return updated
	 #  else	
	 # 		# return "last edit was by #{@lesson.student.display_name} on" + updated.to_s
	 # 		return updated
	 # 	end 
	 return updated
	end
end
