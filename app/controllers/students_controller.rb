class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :get_mailbox, only: [:dashboard]
  before_action :verify_student, only: [:edit, :update, :destroy, :dashboard]

  def index
    @tutors = Tutor.all
  end

  def show
    if(user_signed_in?)
      @messages_count = current_user.mailbox.inbox({:read => false}).count
    end
  end

  def dashboard
    @lessons = @student.lessons
    @conversations = @mailbox.conversations
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
end