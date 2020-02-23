class CardTranslation < ApplicationRecord
    belongs_to :flash_card
    validates_presence_of :language_id, :flash_card_id, :meaning
end
