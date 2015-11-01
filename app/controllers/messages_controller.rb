class MessagesController < ApplicationController
  before_action :authenticate_user!

  def new
    @tutor = Tutor.find_by(id: params[:tutor])
    # existing_conversation = Mailboxer::Conversation.participant(current_user).where('conversations.id in (?)', Mailboxer::Conversation.participant(@tutor).collect(&:id))
    existing_conversation = Mailboxer::Conversation.participant(current_user).participant(@tutor).first

    if existing_conversation.present?
      redirect_to conversation_path(existing_conversation)
    end
  end

  def create
    # if current_user.is_a? Tutor
    # 	recipients = Student.where(id: params['recipients'])
    # else
    # 	recipients = Tutor.where(id: params['recipients'])
    # end

    # conversation = current_user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
    # flash[:success] = "Message has been sent!"
    # redirect_to conversation_path(conversation)

    recipient = Tutor.find_by(id: params[:tutor])
    conversation = current_user.send_message(recipient, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversation_path(conversation)
  end
end