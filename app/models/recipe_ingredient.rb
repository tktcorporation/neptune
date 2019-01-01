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

  validates :name, presence: true, lt4bytes: true
  validates :recipe_id, numericality: { greater_than_or_equal_to: 0, only_integer: true}
  validates :ingredient_id, numericality: { greater_than_or_equal_to: 0, only_integer: true, allow_blank: true}#allow_blank: trueは一時的
  validates :unit_id, numericality: { greater_than_or_equal_to: 0, only_integer: true, allow_blank: true}#allow_blank: trueは一時的
  validates :quantity, numericality: { greater_than_or_equal_to: 0, allow_blank: true}#allow_blank: trueは一時的
  validates :quantity_and_unit, presence: true, lt4bytes: true
  validates :density, numericality: { greater_than_or_equal_to: 0, allow_blank: true}
  validates :calorie, numericality: { greater_than_or_equal_to: 0, allow_blank: true}
  validates :sort_order, numericality: { greater_than_or_equal_to: 0, only_integer: true}

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
