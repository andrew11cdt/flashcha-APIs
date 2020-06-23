class AddTranslateLanguageToCourse < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :translate_language_id, :string
  end
end
