class PdfGenerator < Prawn::Document
  def initialize(attractions)
    super()
    font_families.update("Roboto" => {
      :normal => Rails.root.join("app/assets/fonts/Roboto-Black.ttf"),
    })
    font "Roboto"

    @attractions=attractions
    table [["Nazwa obiektu:","Oplata:","Czas Zwiedzania:"]] do
      columns(0).width =200
      columns(1).width =70
      columns(2).width =110
      style(row(0), :background_color => 'FFCF7F')
    end
    @attractions.each.each do |attraction|
      if attraction.price<=0 then
        data =[[attraction.name,"Obiekt bezpłatny",attraction.sightseeing_time]]
      else
        data =[[attraction.name,attraction.price,attraction.sightseeing_time]]
      end

      table data do
        columns(0).width =200
        columns(1).width =70
        columns(2).width =110
      end
    end
  end
end


