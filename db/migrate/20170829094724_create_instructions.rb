class CreateInstructions < ActiveRecord::Migration[5.1]
  def change
    create_table :instructions do |t|
      t.references :recipe, null: false
      t.integer :sort_order, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
