json.extract! detail, :id, :idFood, :description, :ingredients, :directions, :history, :created_at, :updated_at
json.url detail_url(detail, format: :json)