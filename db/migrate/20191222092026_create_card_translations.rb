class CreateCardTranslations < ActiveRecord::Migration[6.0]
  def change
    create_table :card_translations do |t|
      t.references :flash_card
      t.text :meaning
      t.string :sino_vi
      t.references :language
      t.timestamps
    end
  end
end
