# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all
Attraction.destroy_all
Discount.destroy_all
Guide.destroy_all

category_list = [
  'Teatr',
  'Muzeum',
  'Pomnik',
  'Park',
  'Świątynia',
  'Pałac',
  'Miejsce',
  'Opera'
]

category_list.each do |name|
  Category.create( name: name)
end

# categories = ['Teatr', 'Muzeum', 'Pomnik', 'Park', 'Świątynia', 'Pałac', 'Miejsce', 'Opera'].map do |c|
#     Category.create(name: c)
# end

p "Created #{Category.count} categories"



swiatynia = Category.find_by name: 'Świątynia'
palac = Category.find_by name: 'Pałac'
teatr = Category.find_by name: 'Teatr'
muzeum = Category.find_by name: 'Muzeum'
opera = Category.find_by name: 'Opera'
pomnik = Category.find_by name: 'Pomnik'
park = Category.find_by name: 'Park'
miejsce = Category.find_by name: 'Miejsce'

attraction_list = [
  [
    "Pałac Branickich",
    53.13060489999999,
    23.1651389,
    0,
    "Zabytkowy pałac w Białymstoku, jedna z najlepiej zachowanych rezydencji magnackich epoki saskiej na ziemiach dawnej Rzeczypospolitej w stylu późnobarokowym określany mianem „Wersalu Podlasia”, „Wersalem Północy”, a także „Polskim Wersalem”. Początki pałacu sięgają XVI wieku.",
    30,
    palac.id
  ],
  [
   "Bazylika Archikatedralna Wniebowzięcia Najświętszej Maryi Panny",
   53.1326083,
   23.1630206,
   0,
   "Zespół świątynny w Białymstoku, złożony z dwóch połączonych ze sobą budynków kościelnych: starego oraz nowego.",
   30,
   swiatynia.id
  ],
  [
    "Rynek Kościuszki",
    53.1322542,
    23.1607327,
    0,
    "Reprezentacyjna promenada położona w centrum Białegostoku, ciągnąca się od placu Jana Pawła II, przechodząca w pierzeję południową z ul. Suraską natomiast pierzeja północna w ul. Lipową od skrzyżowania z ul. Spółdzielczą.",
    10,
    miejsce.id
  ],
  [
   "Opera i Filharmonia Podlaska",
   53.1232053,
   23.1652326,
   0,
   "Obecnie największa instytucja artystyczna na terenie północno-wschodniej Polski i najnowocześniejsze centrum kulturalne w tej części Europy. ",
   20,
   opera.id
  ],
  [
   "Katedralna cerkiew św. Mikołaja Cudotwórcy w Białymstoku",
   53.1327094,
   23.1545263,
   0,
   "Katedra prawosławna w Białymstoku, główna świątynia diecezji białostocko-gdańskiej Polskiego Autokefalicznego Kościoła Prawosławnego oraz siedziba białostockiej parafii św. Mikołaja. ",
   25,
   swiatynia.id
  ],
  [
   "Cerkiew Świętego Ducha w Białymstoku",
   53.146869,
   23.121687,
   0,
   "Prawosławna cerkiew parafialna w Białymstoku. Należy do dekanatu Białystok diecezji białostocko-gdańskiej Polskiego Autokefalicznego Kościoła Prawosławnego. Znajduje się w dzielnicy Wysoki Stoczek, przy ulicy Antoniuk Fabryczny 13.",
   25,
   swiatynia.id
  ],
  [
   "Muzeum Historii Medycyny i Farmacji Uniwersytetu Medycznego w Białymstoku",
   53.1313065,
   23.165567,
   0,
   "W zabytkowych wnętrzach dawnego Pałacu Branickich można poznać tajniki historii medycyny oraz farmacji. Ekspozycja muzeum przedstawia dawną aptekę, pokój anatomiczny z preparatami w formalinie, gabinet stomatologiczny, okulistyczny, laryngologiczny, szpital polowy, pokój radiologiczny oraz gabinet ginekologiczny. Ścieżka obejmuje także dostępne pałacowe wnętrza - westybul główny, aule, kaplicę pałacową i piwnice.",
   60,
   muzeum.id
  ],
  [
    "Muzeum Podlaskie w Białymstoku",
    53.1323349,
    23.1588155,
    0,
    "Muzeum Podlaskie w Białymstoku jest największą placówką muzealną w województwie podlaskim. W skład muzeum wchodzi siedem Oddziałów, mieszczących się w obiektach zabytkowych: - Ratusz w Białymstoku - siedziba główna - Muzeum Historyczne w Białymstoku - Muzeum Rzeźby Alfonsa Karnego w Białymstoku - Muzeum Ikon w Supraślu - Muzeum Wnętrz Pałacowych w Choroszczy - Muzeum w Tykocinie - Muzeum w Bielsku Podlaskim",
    70,
    muzeum.id
  ],
  [
    "Pomnik żołnierzy 42 PP w Białymstoku",
    53.1217473,
    23.1639756,
    0,
    "Pomnik znajdujący się w Białymstoku w parku Konstytucji 3 Maja, upamiętniający fakt odzyskania przez Polskę niepodległości oraz żołnierzy 42 pułku piechoty.",
    10,
    [pomnik.id, miejsce.id]
  ],
  [
    "BTL - Białostocki Teatr Lalek",
    53.1309801,
    23.1501928,
    0,
    "Jeden z najstarszych polskich teatrów lalkowych. Mieści się w Białymstoku przy ul. Kalinowskiego 1. W jego repertuarze znajdują się zarówno przedstawienia dla dzieci jak i lalkarskie adaptacje literatury światowej dla dorosłych.",
    50,
    teatr.id
  ]
]

attraction_list.each do |name, x, y, price, description, sightseeing_time, category_ids|
  Attraction.create( name: name, x: x, y: y, price: price, description: description, sightseeing_time: sightseeing_time, category_ids: category_ids )
end

p "Created #{Attraction.count} attractions"



discount_list = [
  [
    "Ulgowa",
    "50%"
  ],
  [
    "Promocja",
    "15%"
  ],
]

discount_list.each do |name, percent|
  Discount.create( name: name, percent: percent)
end

p "Created #{Discount.count} discounts"



guide_list = [
  [
    "Grzegorz",
    "Acki",
    100000000
  ],
  [
    "Bartosz",
    "Backi",
    111111111
  ]
]

guide_list.each do |name, surname, telnumber|
  Guide.create( name: name, surname: surname, telnumber: telnumber)
end

p "Created #{Guide.count} guides"