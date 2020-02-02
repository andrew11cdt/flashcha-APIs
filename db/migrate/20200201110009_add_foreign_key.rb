class AddForeignKey < ActiveRecord::Migration[6.0]
  def change
    remove_column :levels,    :id
    remove_column :languages,    :id

    rename_column :levels, :uuid,    :id
    rename_column :languages, :uuid,    :id
  end
end
