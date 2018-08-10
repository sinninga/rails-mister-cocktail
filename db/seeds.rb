require 'open-uri'
require 'json'

Cocktail.destroy_all
Ingredient.destroy_all


url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
unparsed_ingredients = open(url).read
ingredients = JSON.parse(unparsed_ingredients)
ingredients["drinks"].each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
end

