class GuidesController < ApplicationController
  before_action :set_guide, only: %i[ show edit update destroy ]

  # GET /guides or /guides.json
  def index
    @guides = Guide.all
  end

  # GET /guides/1 or /guides/1.json
  def show
    render plain: "404 Not Found"
  end

  # GET /guides/new
  def new
    render plain: "404 Not Found"
  end

  # GET /guides/1/edit
  def edit
    render plain: "404 Not Found"
  end

  # POST /guides or /guides.json
  def create
    render plain: "404 Not Found"
  end

  # PATCH/PUT /guides/1 or /guides/1.json
  def update
    render plain: "404 Not Found"
  end

  # DELETE /guides/1 or /guides/1.json
  def destroy
    render plain: "404 Not Found"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guide
      @guide = Guide.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def guide_params
      params.require(:guide).permit(:name, :surname, :telnumber)
    end
end
