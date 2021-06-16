class CartController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    respond_to do |format|
      format.html
      format.pdf do
        pdf = PdfGenerator.new(@cart.each)
        send_data pdf.render, type: "application/pdf",
                  disposition: "inline" ,
                  filename: "Wycieczka"
      end
    end
  end


  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)
    @tour.attraction_ids = session[:cart].without(@tour.attraction_end_id, @tour.attraction_start_id)
    @tmp = Attraction.find(@tour.attraction_start_id)
    @tour.totaltime =  @tmp.sightseeing_time
    @tour.sumcosts = @tmp.price
    if @tour.attraction_end_id != @tour.attraction_start_id
      @tmp = Attraction.find(@tour.attraction_end_id)
      @tour.totaltime =  @tmp.sightseeing_time
      @tour.sumcosts += @tmp.price
    end
    Attraction.where(id: @tour.attraction_ids).each do |attraction|
      @tour.totaltime += attraction.sightseeing_time
      @tour.sumcosts += attraction.price
    end
    session[:cart].clear
    respond_to do |format|
      if @tour.save
        current_user.tours << @tour
        format.html { redirect_to my_tour_path(@tour.id), notice: "Trasa została dodana pomyślnie" }
        format.json { render :show, status: :created, location: my_tour_path(@tour.id) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_to_cart
    id=params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id)
    redirect_to request.referrer
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to request.referrer
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    # Only allow a list of trusted parameters through.
    def tour_params()
      params.require(:tour).permit(:guide_id, :attraction_start_id, :attraction_end_id, {attraction_ids: []}, :discount_id)
    end
end
