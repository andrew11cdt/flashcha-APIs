class Course < ApplicationRecord
  has_many :lessons, dependent: :destroy
  has_many :flash_cards, through: :lessons

  belongs_to :language
  belongs_to :level
end
