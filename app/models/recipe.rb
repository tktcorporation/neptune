# == Schema Information
#
# Table name: recipes
#
#  id            :integer          not null, primary key
#  title         :string(255)      not null
#  video_url     :string(255)      not null
#  thumbnail_url :string(255)      not null
#  servings      :string(255)      not null
#  salt          :float(24)
#  calorie       :float(24)
#  introduction  :text(65535)
#  boosted       :boolean          default("0"), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_recipes_on_boosted  (boosted)
#

class Recipe < ApplicationRecord
  has_many :recipe_ingredients, -> { order(sort_order: :asc) }, dependent: :destroy
  has_many :instructions, -> { order(sort_order: :asc) }, dependent: :destroy

  def update_with_relations(recipe_params, recipe_ingredients_params, recipe_ingredient_ids_params, instructions_params, instruction_ids_params)
    #ActiveRecord::Base.transaction do
      self.update_attributes!(recipe_params)
      if recipe_ingredient_ids_params.present?
        self.recipe_ingredients.each_with_index do |ingredient, index|
          attributes = recipe_ingredients_params.fetch(ingredient.id.to_s.to_sym)
          ingredient.update_attributes!(name: attributes[:name], quantity_and_unit: attributes[:quantity_and_unit], sort_order: recipe_ingredient_ids_params.to_h.key(ingredient.id.to_s))
        end
      end
      if instruction_ids_params.present?
        self.instructions.each_with_index do |instruction, index|
          attributes = instructions_params.fetch(instruction.id.to_s.to_sym)
          instruction.update_attributes!(body: attributes[:body], sort_order: instruction_ids_params.to_h.key(instruction.id.to_s))
        end
      end
    #end
    true
  #rescue => e
    #p e.message
    #return false
  end

  def get_kcalorie
    ingredients = self.ingredients
    ingredients.each do |ingredient|

    end
  end

  def self.create_with_relations(recipe_params, recipe_ingredients_params, instructions_params)
    p recipe_ingredients_params
    recipe = self.new(recipe_params)
    ActiveRecord::Base.transaction do
      recipe.save!
      recipe_ingredients_params[:recipe_ingredient].each_with_index do |ingredient, index|
        recipe_ingredient = recipe.recipe_ingredients.new(ingredient)
        recipe_ingredient.sort_order = index
        recipe_ingredient.save!
      end
      instructions_params[:instruction].each_with_index do |instruction, index|
        instruction = recipe.instructions.new(instruction)
        instruction.sort_order = index
        instruction.save!
      end
    end
    true
  rescue => e
    p e.message
    return false
  end

  #下書き
  def self.get_gram(amount_text)
    case amount_text
    when /^(.+)g$/
      $1.to_f
    when /^(.+)パック$/
      $1.to_f * 100
    when /^少々$/
      $1.to_f * 0.5
    when /^大さじ(.+)$/
      $1.to_f * 18.0
    when /^小さじ(.+)$/
      $1.to_f * 4
    end
  end
end
