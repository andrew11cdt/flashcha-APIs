class CreateLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :languages do |t|
      t.string :name, null: false
      t.string :lang_code, null: false
      t.timestamps
    end
  end
end
