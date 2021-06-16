class AttractionsController < ApplicationController
  before_action :set_attraction, only: %i[ show ]

  # GET /attractions or /attractions.json
  def index
    # @attractions = Attraction.all
    @attractions = Attraction.page(params[:page]).per(4)
  end

  # GET /attractions/1 or /attractions/1.json
  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attraction
      @attraction = Attraction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attraction_params
      params.require(:attraction).permit(:name, :x, :y, :price, :description, :sightseeing_time, {category_ids: []}, :image)
    end
end
