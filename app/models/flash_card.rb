class FlashCard < ApplicationRecord
  has_many :card_translations
  belongs_to :lesson
end
