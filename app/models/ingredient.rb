class Ingredient < ApplicationRecord
  has_many :recipe_ingredients

  validates :name, presence: true, lt4bytes: true
  validates :salt, numericality: { greater_than_or_equal_to: 0}
  validates :calorie, numericality: { greater_than_or_equal_to: 0}
  validates :density, numericality: { greater_than_or_equal_to: 0, allow_blank: true }
  validates :g_per_unit, numericality: { greater_than_or_equal_to: 0, allow_blank: true }
  validate :density_or_g_per_unit_must_be_present

  private
    def density_or_g_per_unit_must_be_present
      if density.blank? && g_per_unit.blank?
        errors[:base] << "「密度」か「1単位あたりの重さ(g)」のどちらかは登録する必要があります"
      end
    end
end