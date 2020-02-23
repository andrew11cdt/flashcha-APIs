class FlashCard < ApplicationRecord
  has_many :card_translations
  belongs_to :lesson
  validates_presence_of :word, :lesson_id
end
 