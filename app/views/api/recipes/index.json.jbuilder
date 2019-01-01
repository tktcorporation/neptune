json.set! :recipes do
  json.array! @recipes do |recipe|
    json.extract! recipe, :id, :title, :video_url, :thumbnail_url, :servings, :salt, :calorie, :introduction
  end
end