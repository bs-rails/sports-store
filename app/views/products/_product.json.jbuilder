json.extract! product, :id, :name, :description, :price, :created_at, :updated_at
json.category product.category.name
json.url product_url(product, format: :json)
