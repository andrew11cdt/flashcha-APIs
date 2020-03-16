class Lesson < ApplicationRecord
  has_many :flash_cards, dependent: :destroy
  belongs_to :course
end
