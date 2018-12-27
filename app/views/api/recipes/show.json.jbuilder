json.set! :recipe do
  json.extract! @recipe, :id, :title, :video_url, :thumbnail_url, :servings, :salt, :calorie, :introduction, :created_at, :updated_at
  json.recipe_ingredients do
    json.array! @recipe.recipe_ingredients do |ingredient|
      json.extract! ingredient, :id, :sort_order, :name, :quantity_and_unit, :created_at, :updated_at
    end
  end
  json.instructions do
    json.array! @recipe.instructions do |instruction|
      json.extract! instruction, :id, :sort_order, :body, :created_at, :updated_at
    end
  end
end