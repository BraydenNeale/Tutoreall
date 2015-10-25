class TutorsController < ApplicationController
  before_action :set_tutor, only: [:show, :edit, :update, :destroy]

  def index
    @tutors = Tutor.all
  end

  def show
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
end
