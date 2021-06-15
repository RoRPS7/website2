class AttractionsController < ApplicationController
  before_action :set_attraction, only: %i[ show edit update destroy ]

  # GET /attractions or /attractions.json
  def index
    # @attractions = Attraction.all
    @attractions = Attraction.page(params[:page]).per(6)
  end

  # GET /attractions/1 or /attractions/1.json
  def show
  end

  # GET /attractions/new
  def new
    @attraction = Attraction.new
  end

  # GET /attractions/1/edit
  def edit
  end

  # POST /attractions or /attractions.json
  def create
    @attraction = Attraction.new(attraction_params)

    respond_to do |format|
      if @attraction.save
        format.html { redirect_to @attraction, notice: "Attraction was successfully created." }
        format.json { render :show, status: :created, location: @attraction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attractions/1 or /attractions/1.json
  def update
    respond_to do |format|
      if @attraction.update(attraction_params)
        format.html { redirect_to @attraction, notice: "Attraction was successfully updated." }
        # format.json { render :show, status: :ok, location: @attraction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attractions/1 or /attractions/1.json
  def destroy
    @attraction.destroy
    respond_to do |format|
      format.html { redirect_to attractions_url, notice: "Attraction was successfully destroyed." }
      # format.json { head :no_content }
    end
  end

  def add_to_cart
    id=params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id)
    redirect_to attractions_path
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to request.referrer
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
