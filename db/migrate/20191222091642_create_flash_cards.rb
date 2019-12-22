class CreateFlashCards < ActiveRecord::Migration[6.0]
  def change
    create_table :flash_cards do |t|
      t.references :lesson
      t.string :word
      t.string :hiragana
      t.string :sino
      t.string :ipa
      t.text :example
      t.timestamps
    end
  end
end
