class AreasController < ApplicationController
	def autocomplete
    # render json: Area.all.where("LOWER(name) LIKE ?", "%#{params[:term].downcase}%").map(&:name)
    render json: Area.all.where("LOWER(name) LIKE ? OR LOWER(name) LIKE ?", "% #{params[:term].downcase}%", "#{params[:term].downcase}%").map(&:name)
  end
end
