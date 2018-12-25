class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.string :video_url, null: false
      t.string :thumbnail_url, null: false
      t.string :servings, null: false
      t.float :salt
      t.float :calorie
      t.text :introduction
      t.boolean :boosted, null: false, default: false

      t.timestamps
    end

    add_index :recipes, :boosted
  end
end
