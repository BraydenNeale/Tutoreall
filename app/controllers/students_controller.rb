class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :get_mailbox, only: [:dashboard]
  before_action :verify_student, only: [:edit, :update, :destroy, :dashboard, :calendar]

  def index
    @tutors = Tutor.all
  end

  def show
    # if(user_signed_in?)
    #   @messages_count = current_user.mailbox.inbox({:read => false}).count
    # end
  end

  def dashboard
    @lessons = @student.lessons
    
    @tutors = Set.new
    @lessons.each do |lesson|
      @tutors.add(lesson.tutor)
    end

    @conversations = @mailbox.conversations
  end

  def calendar
    @lessons = @student.lessons
  end

  def new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Profile successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # https://developers.braintreepayments.com/guides/customers/ruby#create
  # Need to refine customer creation and deletion
  # def braintree
  #   gon.client_token = generate_client_token
  # end

  def braintree_create
    if not current_user.has_payment_info?
      result = Braintree::Customer.create(
        first_name: current_user.firstname,
        last_name: current_user.lastname,
        email: current_user.email,
        phone: params[:phone],
        payment_method_nonce: params[:payment_method_nonce]
      )
    else
      result = Braintree::Customer.update(
        current_user.braintree_customer_id, # id of customer to update
        payment_method_nonce: params[:payment_method_nonce]
      )
    end

    if result.success?
      current_user.update(braintree_customer_id: result.customer.id) unless current_user.has_payment_info?
      redirect_to root_url, notice: "Payment info added"
    else
      flash[:alert] = "Something went wrong"
      render :edit
    end
  end

  def braintree_update
    # result = Braintree::Customer.update(
    #   "a_customer_id", # id of customer to update
    #   :first_name => "New First Name",
    #   :last_name => "New Last Name"
    # )
    # if result.success?
    #   puts "customer successfully updated"
    # else
    #   p result.errors
    # end
  end

  private
  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit()
  end

  def verify_student
    set_student
      # sort out error for students who arent' logged in 
      unless current_user.id == @student.id
        redirect_to root, notice: "Forbidden"
      end
  end

  def get_mailbox
    @mailbox ||= current_user.mailbox
  end

  def generate_client_token
    if current_user.has_payment_info?
      Braintree::ClientToken.generate(customer_id: current_user.braintree_customer_id)
    else
      Braintree::ClientToken.generate
      # add an error - can't pay without payment info already added
    end
  end
end