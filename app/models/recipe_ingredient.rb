# == Schema Information
#
# Table name: ingredients
#
#  id                :integer          not null, primary key
#  recipe_id         :integer          not null
#  sort_order        :integer          not null
#  name              :string(255)      not null
#  quantity_and_unit :string(255)      not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_ingredients_on_recipe_id  (recipe_id)
#

class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :unit

  def get_salt_and_calorie
    ingredient = self.ingredient
    gram = 0
    if g_per_unit = ingredient.g_per_unit
      gram = self.quantity * g_per_unit
    elsif density = ingredient.density
      gram = self.quantity * self.unit.volume / 100 * density
    end
    salt = gram / 100 * ingredient.salt
    calorie = gram / 100 * ingredient.calorie
    {salt: salt, calorie: calorie }
  end
end
