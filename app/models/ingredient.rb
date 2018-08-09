class Ingredient < ApplicationRecord
  validates :name, presence: true, allow_blanks: false
  validates :name, uniqueness: true

  has_many :doses
end
