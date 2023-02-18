json.extract! order, :id, :name, :address, :city, :shipped, :cart_id, :created_at, :updated_at
json.url order_url(order, format: :json)
