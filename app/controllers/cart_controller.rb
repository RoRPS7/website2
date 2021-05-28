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

  def destroy
    @tour = Tour.new(tour_params)
    @tour.attraction_ids = session[:cart]
    session[:cart].clear
    respond_to do |format|
      if @tour.save
        current_user.tours << @tour
        format.html { redirect_to @tour, notice: "Tour was successfully created." }
        format.json { render :show, status: :created, location: @tour }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Only allow a list of trusted parameters through.
    def tour_params()
      params.require(:tour).permit(:guide_id, :attraction_start_id, :attraction_end_id, {attraction_ids: []})
    end
end
