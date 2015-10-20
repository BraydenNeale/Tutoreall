class ConversationsController < ApplicationController
	before_action :authenticate_user!
	before_action :get_mailbox
	before_action :get_mailbox, except: [:index]

	def show
	end

	def index
		@conversations = @mailbox.inbox.paginate(page: params[:page], per_page: 10)
	end

	private

	def get_mailbox
		@mailbox ||= current_user.mailbox
	end

	def get_conversation
		@conversation ||= @mailbox.conversations.find(params[:id])
	end
end