class Language < ApplicationRecord
    validates :name, :lang_code,
    uniqueness: {
        scope: [:name, :lang_code],
        case_sensitive: false,
        message: "^This language already exits!",
        status: 409
      },
      on: :create
end
