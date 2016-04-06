class TutorsController < ApplicationController
  before_action :set_tutor, only: [:show, :edit, :update, :destroy, :join_organisation, :add_bank_account]
  before_action :verify_tutor, only: [:edit, :update, :destroy, :dashboard, :calendar]
  before_action :get_mailbox, only: [:dashboard]

  def index
    require 'will_paginate/array'

    @found = false

    # Where subject is faculty in this case
    if params[:area] or params[:subject]
      @tutors = Tutor.simple_search(params[:area], params[:subject])
    elsif params[:search]
      @tutors = Search.find(params[:search]).tutors
    else
      @tutors = Array.new
    end

    if not @tutors.any?
      @tutors = Tutor.featured_tutors
    else
      @found = true
    end

    @tutors = @tutors.paginate(:page => params[:page], :per_page => 8)
  end

  def show    
    @similar = Tutor.similar_tutors(@tutor)
  end

  def dashboard
    @lessons = @tutor.lessons
    @students = Set.new
    @lessons.each do |lesson|
      @students.add(lesson.student)
    end

    @conversations = @mailbox.conversations
  end

  def calendar
     @lessons = @tutor.lessons
  end

  def new
  end

  def edit
    @tutor.build_wwc_card if @tutor.wwc_card.nil?
    @tutor.build_bank_account if @tutor.bank_account.nil?

    @current_suburb = ""
    tutor_area = Area.find_by_id(@tutor.suburb)
    if(tutor_area.present?)
      @current_suburb = tutor_area.display_name
    end
  end

  def update
    if(params[:suburb_name].present?)
      area = Area.where("lower(name) like ?", "%#{params[:suburb_name].downcase}%").first
      if(area.present?)
        @tutor.suburb = area.id
      end
    end
    
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

  def add_bank_account
    respond_to do |format|
      if @tutor.update(tutor_params)
        format.html { redirect_to edit_tutor_path(@tutor), notice: 'Bank account successfully added.' }
        format.json { render :edit, status: :ok, location: @tutor }
      else
        format.html { redirect_to edit_tutor_path(@tutor), notice: 'Error: Could not update account info' }
        format.json { render json: @tutor.errors, status: :unprocessable_entity }
      end
    end
  end

  def join_organisation
    respond_to do |format|
      if @tutor.update(tutor_params)
        if(@tutor.is_get_ahead_tutor?)
          @tutor.rate = 40.00
          @tutor.save!
        end
        format.html { redirect_to edit_tutor_path(@tutor), notice: 'Request to join organisation submitted.' }
        format.json { render :edit, status: :ok, location: @tutor }
      else
        format.html { redirect_to edit_tutor_path(@tutor), notice: 'Error: Organisations could not be updated' }
        format.json { render json: @tutor.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_tutor
    @tutor = Tutor.find(params[:id])
  end

  def tutor_params
    params.require(:tutor).permit(:picture, :rate, :about, :experience, :date_of_birth, :suburb, :area_id, :sex, :subject_ids => [], :availability => [], :organisation_ids => [], wwc_card_attributes: [:number, :expiry], bank_account_attributes: [:bsb, :number, :name])
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
    area = tutor.suburb.present?
    
    # wwc = verify_wwc_card(tutor.wwc_card)
    wwc = true

    # account information
    if(rate and birth and area and wwc)
      return true
    end

    return false;
  end

  def get_mailbox
    @mailbox ||= current_user.mailbox
  end
end
