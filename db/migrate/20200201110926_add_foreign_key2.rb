class AddForeignKey2 < ActiveRecord::Migration[6.0]
  def change

    # execute "ALTER TABLE courses            ADD PRIMARY KEY (id);"
    # execute "ALTER TABLE lessons            ADD PRIMARY KEY (id);"
    # execute "ALTER TABLE flash_cards        ADD PRIMARY KEY (id);"
    # execute "ALTER TABLE card_translations  ADD PRIMARY KEY (id);"
    
    execute "ALTER TABLE levels            ADD PRIMARY KEY (id);"
    execute "ALTER TABLE languages            ADD PRIMARY KEY (id);"

    add_foreign_key :courses, :levels
    add_foreign_key :courses, :languages

    add_foreign_key :lessons, :courses

    add_foreign_key :flash_cards, :lessons

    add_foreign_key :card_translations, :flash_cards
    add_foreign_key :card_translations, :languages
  end
end
