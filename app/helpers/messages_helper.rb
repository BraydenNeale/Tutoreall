module MessagesHelper
	def recipients_options
		s = ''
		if is_tutor
			Student.all.each do |user|
				s << "<option value='#{user.id}'>#{user.display_name}</option>"
			end
		else
			Tutor.all.each do |user|
				s << "<option value='#{user.id}'>#{user.display_name}</option>"
			end
		end
		s.html_safe
	end

	# get name of other participants - limited to 2 users (IM)
	def participant_name(conversation)
    conversation.receipts.reject { |p| p.receiver == current_user }.collect {|p| p.receiver.display_name }.uniq.join(", ")
  end

  def get_partner(conversation)
  	# Only between 2 users
  	return conversation.receipts.reject { |p| p.receiver == current_user }.first
  end
end
