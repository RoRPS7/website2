json.extract! attraction, :id, :name, :x, :y, :price, :description, :time, :category_id, :created_at, :updated_at
json.url attraction_url(attraction, format: :json)
