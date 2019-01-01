class Instruction < ApplicationRecord
  belongs_to :recipe

  validates :body, presence: true, lt4bytes: true
  validates :recipe_id, numericality: { greater_than_or_equal_to: 0, only_integer: true}
  validates :sort_order, numericality: { greater_than_or_equal_to: 0, only_integer: true}
end
