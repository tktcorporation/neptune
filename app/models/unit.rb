class Unit < ApplicationRecord
  has_many :recipe_ingredients

  validates :name, presence: true, lt4bytes: true
  validates :position, inclusion: { in: [true, false] }
  validates :volume, numericality: { greater_than_or_equal_to: 0, allow_blank: true}
end