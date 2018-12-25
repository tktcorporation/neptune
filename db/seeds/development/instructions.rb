instructions = [
  '豆苗は根元を切り落とします。',
  '豚肉をひろげ、もやしと豆苗をのせたら塩こしょうをして手前から巻きます。',
  '耐熱皿に乗せ、ラップをしたら600Wのレンジで5分加熱します。',
  '①を合わせます。',
  'ラップをはずし、①をかけたら完成です。'
]
Recipe.all.each do |recipe|
  instructions.each_with_index do |body, index|
    recipe.instructions.create({
      sort_order: index+1,
      body: body
    })
  end
end
