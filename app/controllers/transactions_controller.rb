class TransactionsController < ApplicationController
  before_action :authenticate_student!

  def new
    gon.client_token = generate_client_token
  end

  def create
    # will be directed here from lesson accept or edit page as a student - amount will be determined from that
    unless current_user.has_payment_info?
    # move the payment info account stuff into a student payment form before this
      @result = Braintree::Transaction.sale(
        amount: 5,
        payment_method_nonce: params[:payment_method_nonce],
        customer: {
          first_name: current_user.firstname
          last_name: current_user.lastname
          email: current_user.email
          phone: params[:phone]
        },
        options: {
          store_in_vault: true
        })
    else
      @result = Braintree::Transaction.sale(
        amount: 5,
        payment_method_nonce: params[:payment_method_nonce])
    end
    # @result.transaction.payment_instrument_type is the type of payment that was used credit/paypal

    if @result.success?
      current_user.update(braintree_customer_id: @result.transaction.customer_details) unless current_user.has_payment_info?
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
    if current_user.has_payment_info?
      Braintree::ClientToken.generate(customer_id: current_user.braintree_customer_id)
    else
      Braintree::ClientToken.generate
  end
end
