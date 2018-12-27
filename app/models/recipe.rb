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
  has_many :recipe_ingredients, dependent: :destroy
  has_many :instructions, dependent: :destroy

  def get_kcalorie
    ingredients = self.ingredients
    ingredients.each do |ingredient|

    end
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
