json.set! :recipe do
  json.extract! @recipe, :id, :title, :video_url, :thumbnail_url, :servings, :introduction
  json.salt = @salt_and_calorie[:salt]
  json.calorie = @salt_and_calorie[:calorie]
  json.recipe_ingredients do
    json.array! @recipe.recipe_ingredients do |ingredient|
      json.extract! ingredient, :sort_order, :name, :quantity_and_unit
    end
  end
  json.instructions do
    json.array! @recipe.instructions do |instruction|
      json.extract! instruction, :sort_order, :body
    end
  end
end