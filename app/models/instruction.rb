# == Schema Information
#
# Table name: instructions
#
#  id         :integer          not null, primary key
#  recipe_id  :integer          not null
#  sort_order :integer          not null
#  body       :text(65535)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_instructions_on_recipe_id  (recipe_id)
#

class Instruction < ApplicationRecord
  belongs_to :recipe
end
