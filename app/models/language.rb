class Language < ApplicationRecord
    validates_uniqueness_of :name, :lang_code
end
