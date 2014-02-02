json.array!(@foods) do |food|
  json.extract! food, :id, :name, :deadline
  json.url fridge_food_url(@fridge, food, format: :json)
end
