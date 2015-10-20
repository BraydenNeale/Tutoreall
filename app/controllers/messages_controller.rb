class MessagesController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    # recipients = User.where(id: params['recipients'])
    if is_tutor?
    	recipients = Student.where(id: params['recipicents'])
    else
    	recipients = Tutor.where(id: params['recipicents'])
    end
    conversation = current_user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversation_path(conversation)
  end
end