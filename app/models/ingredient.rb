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

class Ingredient < ApplicationRecord
  belongs_to :recipe
end
