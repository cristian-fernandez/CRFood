json.extract! food, :id, :name, :idType, :averageRating, :language, :created_at, :updated_at
json.url food_url(food, format: :json)