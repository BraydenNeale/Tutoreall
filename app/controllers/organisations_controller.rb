class OrganisationsController < ApplicationController
  before_action :set_organisation, only: [:show, :edit, :update, :destroy]
  before_action :verify_organisation, only: [:edit, :update, :destroy, :dashboard, :calendar]

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  private
  def set_organisation
    @organisation = Organisation.find(params[:id])
  end

  def verify_organisation
  end

  def organisation_params
    params.require(:organisation).permit(:name, :about, :fee, :logo, :banner, :email, :website, :tutor_ids => [], bank_account_attributes: [:bsb, :number, :name])
  end
end
