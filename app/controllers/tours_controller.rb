class ToursController < ApplicationController
  before_action :set_tour, only: %i[ show edit update destroy ]
  before_action :set_my_tour, only: %i[ my_show destroy ]
  # GET /tours or /tours.json
  def index
    @tours = Tour.all
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

  def get_html
    ActionController::Base.new.render_to_string(template: 'my_show.pdf.erb,')
  end

  # GET /tours/1 or /tours/1.json
  def show
  end

  # GET /tours/new
  def new
    @tour = Tour.new
  end

  # GET /tours/1/edit
  def edit
  end

  # POST /tours or /tours.json
  def create
    @tour = Tour.new(tour_params)
    respond_to do |format|
      if @tour.save
        format.html { redirect_to my_tour_path, notice: "Tour was successfully created." }
        format.json { render :show, status: :created, location: @tour }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tours/1 or /tours/1.json
  def update
    respond_to do |format|
      if @tour.update(tour_params)
        format.html { redirect_to my_tour_path, notice: "Tour was successfully updated." }
        format.json { render :show, status: :ok, location: @tour }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tours/1 or /tours/1.json
  def destroy
    @tour.destroy
    respond_to do |format|
      format.html { redirect_to tours_url, notice: "Tour was successfully destroyed." }
      format.json { head :no_content }
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
