class ConversationsController < ApplicationController
	before_action :authenticate_user!
	before_action :get_mailbox
	before_action :get_conversation, except: [:index]

	def show
		# if @conversation.is_unread?(current_user)
			# mark as read .. somehow
		# end
		# mark_as_read
		@conversation.mark_as_read(current_user)
	end

	def index
		@conversations = @mailbox.conversations.paginate(page: params[:page], per_page: 10)

		if params[:current].present?
			@current = @mailbox.conversations.find(params[:current])
			@current.mark_as_read(current_user)
		else
			@current = @conversations.first
		end
	end

	def reply
	  current_user.reply_to_conversation(@conversation, params[:body])
	  flash[:success] = 'Reply sent'
	  # redirect_to conversation_path(@conversation)
	  redirect_to conversations_path(current: @conversation.id)
	end

	def mark_as_read
		@conversation.mark_as_read(current_user)
		flash[:success] = 'The conversation was marked as read'
		redirect_to conversation_path(@conversation)
	end

	private

	def get_mailbox
		@mailbox ||= current_user.mailbox
	end

	def get_conversation
		@conversation ||= @mailbox.conversations.find(params[:id])
	end
end
