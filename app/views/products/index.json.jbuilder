json.array!(@products) do |product|
  json.extract! product, :id, :name, :price, :image, :description, :mark
  json.url product_url(product, format: :json)
end
