class AddDensityToIngredients < ActiveRecord::Migration[5.1]
  def change
    add_column :ingredients, :density, :float
    add_column :ingredients, :calorie, :float
  end
end
