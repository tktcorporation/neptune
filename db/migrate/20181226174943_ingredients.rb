class Ingredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :name, null: false
      t.float :salt
      t.float :calorie
      t.float :density

      t.timestamps
    end
  end
end
