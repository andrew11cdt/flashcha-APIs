class AddLvlNoToLevels < ActiveRecord::Migration[6.0]
  def change
    add_column :levels, :lvl_no, :integer, default: 1
  end
end
