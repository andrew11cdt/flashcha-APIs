class AddExMeaningToCardTranslation < ActiveRecord::Migration[6.0]
  def change
    add_column :card_translations, :ex_meaning, :string
  end
end
