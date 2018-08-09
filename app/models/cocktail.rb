class Cocktail < ApplicationRecord
  validates :name, presence: true, allow_blanks: false
  validates :name, uniqueness: true

  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
end

