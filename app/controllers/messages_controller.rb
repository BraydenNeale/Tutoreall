class MessagesController < ApplicationController
  before_action :authenticate_user!

  def new
    # if current_user.is_a? Tutor
    #   recipient = Student.where(id: params['recipients'])
    # else
    #   recipient = Tutor.where(id: params['recipients'])
    # end

    # existing_conversation = Mailboxer::Conversation.find(params[:id])
    # if existing_conversation.present?
    #   redirect_to conversation_path(conversation)
    # end
    @tutor = Tutor.find_by(id: params[:tutor])
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
    # current_user.send_message(@recipient, params[:body], params[:subject])
    conversation = current_user.send_message(recipient, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversation_path(conversation)
  end
end