class ToursController < ApplicationController
  before_action :set_tour, only: %i[ show edit update destroy ]
  before_action :set_my_tour, only: %i[ my_show ]
  # GET /tours or /tours.json
  def index
    @tours = Tour.find(1,2,3,4)
  end

  def my
    @tours = current_user.tours
  end

  def my_show
    respond_to do |format|
      format.html
      format.pdf do
        instructions = params[:instruction]
        instructions = instructions.to_s.gsub(/<br>/, "|")
        instructions = instructions.gsub(/<b>/, " ")
        instructions = instructions.gsub(/<\/b>/, " ")
        instructions = instructions.gsub(/<div style="font-size:0.9em">/, "")
        instructions = instructions.gsub(/<\/div>\. Segment/, "\n\n\nSegment")
        instructions = instructions.gsub(/<\/div>/, ". ")
        instructions = instructions.gsub(/<wbr\/>/, " ")
        time = params[:total_t]
        distance = params[:total_d] 
        pdf = PdfGenerator.new(current_user.tours.find(params[:id]),instructions,time, distance)
        send_data pdf.render, type: "application/pdf",
                 disposition: "inline" ,
                  filename: "Wycieczka"

      end
    end
  end

  def add_to_my_tours
    @id=Tour.find(params[:id])
    current_user.tours << @id unless current_user.tours.include?(@id)
    redirect_to root_path, notice: "Trasa została dodana do Twojego konta"
  end

  # GET /tours/1 or /tours/1.json
  def show
  end


  # DELETE /tours/1 or /tours/1.json
  def destroy
    if [1,2,3,4].include? @tour.id
      current_user.tours.destroy(@tour.id)

      respond_to do |format|
      format.html { redirect_to root_path, notice: "Trasa usunięta z Twojego panelu." }
      end

    else
      @tour.destroy
      respond_to do |format|
        format.html { redirect_to root_path, notice: "Trasa usunięta z Twojego panelu." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour
      @tour = Tour.find(params[:id])
    end

    def set_my_tour
      @tour = current_user.tours.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tour_params
      params.require(:tour).permit(:guide_id, :attraction_start_id, :attraction_end_id, {attraction_ids: []},:instruction, :discount_id, :information, :total_d, :total_t)
    end
end
