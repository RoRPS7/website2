class DiscountsController < ApplicationController
  before_action :set_discount, only: %i[ show edit update destroy ]

  # GET /discounts or /discounts.json
  def index
    @discounts = Discount.all
  end

  # GET /discounts/1
  def show
    render plain: "404 Not Found"
  end

  # GET /discounts/new
  def new
    render plain: "404 Not Found"
  end

  # GET /discounts/1/edit
  def edit
    render plain: "404 Not Found"
  end

  # POST /discounts or /discounts.json
  def create
    render plain: "404 Not Found"
  end

  # PATCH/PUT /discounts/1 or /discounts/1.json
  def update
    render plain: "404 Not Found"
  end

  # DELETE /discounts/1 or /discounts/1.json
  def destroy
    render plain: "404 Not Found"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discount
      @discount = Discount.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def discount_params
      params.require(:discount).permit(:name, :percent)
    end
end
