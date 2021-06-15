class AttractionsController < ApplicationController
  before_action :set_attraction, only: %i[ show edit update destroy ]

  # GET /attractions or /attractions.json
  def index
    # @attractions = Attraction.all
    @attractions = Attraction.page(params[:page]).per(4)
  end

  # GET /attractions/1 or /attractions/1.json
  def show
  end

  # GET /attractions/new
  def new
    render plain: "404 Not Found"
  end

  # GET /attractions/1/edit
  def edit
    render plain: "404 Not Found"
  end

  # POST /attractions or /attractions.json
  def create
    render plain: "404 Not Found"
  end

  # PATCH/PUT /attractions/1 or /attractions/1.json
  def update
    render plain: "404 Not Found"
  end

  # DELETE /attractions/1 or /attractions/1.json
  def destroy
    render plain: "404 Not Found"
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
