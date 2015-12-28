class SearchesController < ApplicationController
  def new
    @search = Search.new
  end

  def create 
    @search = Search.new(search_params)

    respond_to do |format|
      if @search.save
        format.html { redirect_to @search, notice: 'search was successfully created.' }
        format.json { render :show, status: :created, location: @search }
      else
        format.html { render :new }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @search = Search.find(params[:id])
  end

  private

  def search_params
      params.require(:search).permit(:area, :subjects, :availability, :age)
    end
end
