json.extract! dish, :id, :name, :price, :description, :image, :special, :category_name, :branch_name, :created_at, :updated_at
json.url dish_url(dish, format: :json)
