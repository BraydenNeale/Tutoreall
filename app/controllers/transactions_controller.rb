class TransactionsController < ApplicationController
  before_action :authenticate_student!

  def new
  end

  private
end
