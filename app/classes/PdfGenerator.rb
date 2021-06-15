class PdfGenerator < Prawn::Document
  def initialize(tours,instruction,time, distance)
    super()
    font_families.update("Roboto" => {
      :normal => Rails.root.join("app/assets/fonts/Roboto-Black.ttf"),
    })
    font "Roboto"

    font_size(24) do
      text "\n\n\n BialystokRoutes - Trasa przejścia\n\n\n", :align => :center
    end
    
    
    image "#{Rails.root}/app/assets/images/logo.png", :at => [240,730], :width => 65

      font_size(16) do
        text "Atrakcje na trasie" + "\n\n", :align => :center
      end
      
      @tour = Attraction.find(tours.attraction_start_id).name
      text "Atrakcja początkowa: "+ @tour + "\n\nAtrakcje przejściowe: \n"
      
      tours.attractions.each do |attraction|
        text attraction.name
      end

      @tour = Attraction.find(tours.attraction_end_id).name
      text "Atrakcja końcowa: "+ @tour + "\n\n"

    font_size(16) do
      text "Informacje dodatkowe:\n"
    end
    text "Całkowite opłaty: " + tours.sumcosts.to_s + "zł"

    if !tours.discount_id.nil?
      tmp = tours.sumcosts - (tours.sumcosts * (1/Discount.find(tours.discount_id).percent)).round(2)
      tmp = tmp.to_s
      text "Całkowita opłata ze zniżką: " + tmp +" zł."
    end

      text time
      text distance
    font_size(16) do
       text "\n\nInstrukcja przejscia:", :align => :center
    end
    text instruction
  end
end


