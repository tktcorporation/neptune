ingredients = [
  [
    'もやし', '100g'
  ],
  [
    '豆苗', '1パック'
  ],
  [
    '豚バラ肉', '150g'
  ],
  [
    '塩こしょう', '少々'
  ],
  [
    '①しょうゆ', '大さじ1'
  ],
  [
    '①鶏ガラスープの素', '小さじ1/2'
  ],
  [
    '①白いりごま', '大さじ1'
  ],
  [
    '①ラー油', '小さじ1/2'
  ]
]

Recipe.all.each do |recipe|
  ingredients.each_with_index do |array, index|
    name = array[0]
    quantity_and_unit = array[1]
    recipe.ingredients.create({
      sort_order: index+1,
      name: name,
      quantity_and_unit: quantity_and_unit
    })
  end
end
