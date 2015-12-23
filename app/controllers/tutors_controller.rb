class TutorsController < ApplicationController
  before_action :set_tutor, only: [:show, :edit, :update, :destroy]
  before_action :verify_tutor, only: [:edit, :update, :destroy, :dashboard, :calendar]
  before_action :get_mailbox, only: [:dashboard]


  def index
    # alltutors = Tutor.all.where(verified: true)
    alltutors = Tutor.all

    # Where subject is faculty in this case
    if params[:area] or params[:subject]
      @tutors = alltutors.simple_search(params[:area], params[:subject])
    else
      @tutors = alltutors
      # @tutors = Array.new
    end
  end

  def show
    # only displayed if the profile is that of the current user
    if(user_signed_in?)
      @messages_count = current_user.mailbox.inbox({:read => false}).count
    end

    # 2 random tutors that aren't this tutor
    @similar = Tutor.all.where.not(id: @tutor.id).order("RANDOM()").limit(2)
  end

  def dashboard
    @lessons = @tutor.lessons
    @conversations = @mailbox.conversations
  end

  def calendar
     @lessons = @tutor.lessons
  end

  def new
  end

  def edit
    @tutor.build_wwc_card if @tutor.wwc_card.nil?
  end

  def update
    if(is_verified(@tutor))
      @tutor.verified = true
    end

    respond_to do |format|
      if @tutor.update(tutor_params)
        format.html { redirect_to @tutor, notice: 'Profile successfully updated.' }
        format.json { render :show, status: :ok, location: @tutor }
      else
        format.html { render :edit }
        format.json { render json: @tutor.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_tutor
    @tutor = Tutor.find(params[:id])
  end

  def tutor_params
      params.require(:tutor).permit(:picture, :rate, :about, :experience, :date_of_birth, :subject_ids => [], 
        :area_ids => [], :weekday_ids => [], wwc_card_attributes: [:number, :expiry])
  end

  def verify_tutor
    set_tutor
    # sort out error for students who arent' logged in 
    unless current_user.id == @tutor.id
      redirect_to root, notice: "Forbidden"
    end
  end

  # all required fields have been filled out, tutor has a valid wwc card and tutor has an account linked (how to check valid?)
  def is_verified(tutor)
    rate = tutor.rate.present?
    birth = tutor.date_of_birth.present?
    
    wwc = verify_wwc_card(tutor.wwc_card)

    # account information
    if(rate and birth and wwc)
      return true
    end

    return false;
  end

  def verify_wwc_card(wwc)
    if not wwc.present?
      return false
    end

    # WWC num is 6 chars long
    if wwc.number.length != 6
      # errors.add :base, 'Number not correct format'
      return false
    end

    # WWC num is all digits
    if !/\A\d+\z/.match(wwc.number) # if not a positive number
      # errors.add :base, 'Number not correct format'
      return false
    end

    # if card has expired
    if(wwc.expiry <= Date.today)
      # errors.add :base, "Card has expired"
      return false
    end

    # complex selenium script or compare with webscraped data 
    # to determine if is valid according to www.checkwwc.wa.gov.au/

    return true
  end

  def get_mailbox
    @mailbox ||= current_user.mailbox
  end
end
