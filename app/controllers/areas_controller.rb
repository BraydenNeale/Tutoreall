class AreasController < ApplicationController

	def autocomplete
    @areas = Area.all
    render json: @areas.where("LOWER(name) LIKE ?", "%#{params[:term].downcase}%").map(&:name)
  end
end
