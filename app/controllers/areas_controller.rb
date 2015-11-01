class AreasController < ApplicationController

	def autocomplete
    render json: Area.all.where("LOWER(name) LIKE ?", "%#{params[:term].downcase}%").map(&:name)
  end
end
