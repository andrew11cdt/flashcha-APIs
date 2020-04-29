class Language < ApplicationRecord
    validates :name, :lang_code , uniqueness: true
end
