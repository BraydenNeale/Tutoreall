class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy, :approve, :cancel]
  before_action :authenticate_user!
  before_action :verify_user, only: [:edit, :update, :destroy, :show]

  # GET /lessons
  # GET /lessons.json
  def index
    @lessons = Lesson.all
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
    # gon token for braintree payment 
    # if current_user.is_a? Student
    #   gon.client_token = generate_client_token
    # end
  end

  # GET /lessons/new
  def new
    # @lesson = current_user.lessons.build
    @lesson = Lesson.new
    @student = Student.find_by(id: params[:student])
    @tutor = Tutor.find_by(id: params[:tutor])
  end

  # GET /lessons/1/edit
  def edit
  end

  # POST /lessons
  # POST /lessons.json
  def create
    @lesson = Tutor.find(params[:lesson][:tutor_id]).lessons.build(lesson_params)
    
    respond_to do |format|
      if @lesson.save
        UserMailer.new_lesson_email(@lesson, current_user).deliver_later
        format.html { redirect_to @lesson, notice: 'Lesson was successfully created.' }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # could/should refactor approve/cancel into update

  # put
  def approve
    @lesson.status = "approved"
    if @lesson.save
      UserMailer.lesson_change_email(@lesson, current_user).deliver_later
      flash[:notice] = "Lesson Approved"
      redirect_to @lesson
    else
      flash[:notice] = "something went wrong"
      redirect_to @lesson
    end
  end

  # put
  def cancel
    @lesson.status = "cancelled"
    if @lesson.save
      # specific cancel email later:
      UserMailer.lesson_change_email(@lesson, current_user).deliver_later
      flash[:notice] = "Lesson Cancelled"
      redirect_to @lesson
    else
      flash[:notice] = "something went wrong"
      redirect_to @lesson
    end
  end

  # PATCH/PUT /lessons/1
  # PATCH/PUT /lessons/1.json
  def update
    # Need to move these out of update in order to refactor approve - for some reason not going through params
    @lesson.status = params[:status]
    @lesson.tutor_change = params[:tutor_change]
    @lesson.subject = params[:subject]

    respond_to do |format|
      if @lesson.update(lesson_params)
        UserMailer.lesson_change_email(@lesson, current_user).deliver_later
        format.html { redirect_to @lesson, notice: 'Lesson was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to lessons_url, notice: 'Lesson was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_params
      params.require(:lesson).permit(:student_id, :date, :status, :subject, :description, :duration, :tutor_change, :location)
    end

    def verify_user
      set_lesson
      unless current_user.id == @lesson.tutor_id || current_user.id == @lesson.student.id
        redirect_to root_path, notice: "Forbidden"
      end
    end

    def generate_client_token
      if current_user.has_payment_info?
        Braintree::ClientToken.generate(customer_id: current_user.braintree_customer_id)
      else
        Braintree::ClientToken.generate
      end
    end
end
