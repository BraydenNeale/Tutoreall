class SearchesController < ApplicationController
  def new
    @search = Search.new
  end

  def create 
    @search = Search.new(search_params)
    @search.save
    redirect_to tutors_path(search: @search.to_param)
  end

  def show
    @search = Search.find(params[:id])
  end

  private

  def search_params
    params.require(:search).permit(:area, :age, :sex, :subjects => [], :availability => [])
  end
end
