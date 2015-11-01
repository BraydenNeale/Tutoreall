class AreasController < ApplicationController
	
	def autocomplete
    # Elasticsearch? - not used
    @areas = Area.all
    # render json: @areas.where("LOWER(name) LIKE ?", "%#{params[:term].downcase}%").map(&:name)
    render json: %w[foo bar]
  end
end
