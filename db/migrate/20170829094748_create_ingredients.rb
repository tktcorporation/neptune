class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.references :recipe, null: false
      t.integer :sort_order, null: false
      t.string :name, null: false
      t.string :quantity_and_unit, null: false

      t.timestamps
    end
  end
end
