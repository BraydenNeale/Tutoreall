class TransactionsController < ApplicationController
  before_action :authenticate_student!

  def new
    gon.client_token = generate_client_token
  end

  def create
    # will be directed here from lesson accept or edit page as a student - amount will be determined from that
    @result = Braintree::Transaction.sale(
      amount: 5,
      payment_method_nonce: params[:payment_method_nonce])

    # @result.transaction.payment_instrument_type is the type of payment that was used credit/paypal

    if @result.success?
      # Change state of lesson
      # some other validations ... in the db
      redirect_to root_url, notice: "Lesson has been booked"
    else
      flash[:alert] = "Something went wrong"
      gon.client_token = generate_client_token
      render :new
    end
  end

  private
  def generate_client_token
    Braintree::ClientToken.generate
  end
end
