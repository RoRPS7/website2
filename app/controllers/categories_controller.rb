class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]

  # GET /categories or /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1 or /categories/1.json
  def show
    render plain: "404 Not Found"
  end

  # GET /categories/new
  def new
    render plain: "404 Not Found"
  end

  # GET /categories/1/edit
  def edit
    render plain: "404 Not Found"
  end

  # POST /categories or /categories.json
  def create
    render plain: "404 Not Found"
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    render plain: "404 Not Found"
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    render plain: "404 Not Found"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name)
    end
end
