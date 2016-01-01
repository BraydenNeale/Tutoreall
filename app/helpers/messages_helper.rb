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
  	return conversation.participants.find { |p| p != current_user }
  end

  def get_conversation(student, tutor)
    conv_check_1 = Mailboxer::Conversation.participant(tutor)
    conv_check_2 = Mailboxer::Conversation.participant(student)
    return (conv_check_1 & conv_check_2).first.id
  end

  def is_conversation(student, tutor)
    conv_check_1 = Mailboxer::Conversation.participant(tutor)
    conv_check_2 = Mailboxer::Conversation.participant(student)
    existing = (conv_check_1 & conv_check_2).first

    unless existing.nil? or !existing.is_participant?(current_user)
      return true
    end

    return false
  end

  def unread_message_count
    count = current_user.mailbox.inbox({:read => false}).count

    if count > 0 
      return " - #{count}" 
    end

    return ""
  end
end
