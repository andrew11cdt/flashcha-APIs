class Lesson < ApplicationRecord
  has_many :flash_cards
  belongs_to :course
end
