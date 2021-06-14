

class PdfGenerator < Prawn::Document
  def initialize(tours,instruction)
    super()
    font_families.update("Roboto" => {
      :normal => Rails.root.join("app/assets/fonts/Roboto-Black.ttf"),
    })
    font "Roboto"

    font_size(24) do
      text "\n\n\n bruh\n\n\n", :align => :center
      text instruction , :align => :center
    end

    image "#{Rails.root}/app/assets/images/logo.png", :at => [240,730], :width => 65
    #table [["Nazwa obiektu:","Oplata:","Czas Zwiedzania:"]] do
    #  columns(0).width =200vvv
    #  columns(1).width =70
    #  columns(2).width =110
    #  style(row(0), :background_color => 'FFCF7F')vvvvvvvvvvvvv
    #end

    tours.attractions.each do |attraction|
        font_size(16) do
          text attraction.name + "\n\n", :align => :center
        end
        text attraction.description + "\n\n\n"

      #data =[[attractions.attractions.name,attractions.id,"nuts"]]
      #table data do
      #  columns(0).width =200
      #  columns(1).width =70
      #  columns(2).width =110
      #end
    end
  end
end


