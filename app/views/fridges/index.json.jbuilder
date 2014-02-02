json.array!(@fridges) do |fridge|
  json.extract! fridge, :id, :name, :user_id
  json.url fridge_url(fridge, format: :json)
end
