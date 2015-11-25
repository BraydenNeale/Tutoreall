class TutorsController < ApplicationController
  before_action :set_tutor, only: [:show, :edit, :update, :destroy]
  before_action :verify_tutor, only: [:edit, :update, :destroy, :dashboard, :calendar]
  before_action :get_mailbox, only: [:dashboard]


  def index
    # if params[:subject]
    #   @tutors = Tutor.searchSubject(params[:subject])
    # elsif params[:area]
    #   @tutors = Tutor.searchArea(params[:area])
    # else
    #   @tutors = Tutor.all
    # end

    if params[:area] or params[:subject]
      @tutors = Tutor.search(params[:area], params[:subject])
    else
      @tutors = Tutor.all
    end
  end

  def show
    # only displayed if the profile is that of the current user
    if(user_signed_in?)
      @messages_count = current_user.mailbox.inbox({:read => false}).count
    end
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
  end

  def update
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
      params.require(:tutor).permit(:picture, :rate, :age, :about, :experience, :subject_ids => [], :area_ids => [])
  end

  def verify_tutor
  set_tutor
    # sort out error for students who arent' logged in 
    unless current_user.id == @tutor.id
      redirect_to root, notice: "Forbidden"
    end
  end

  def get_mailbox
    @mailbox ||= current_user.mailbox
  end
end
