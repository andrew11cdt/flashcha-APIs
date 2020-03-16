class FlashCard < ApplicationRecord
  has_many :card_translations, dependent: :destroy
  belongs_to :lesson
  validates_presence_of :word, :lesson_id
end
 