class CreateLevels < ActiveRecord::Migration[6.0]
  def change
    create_table :levels do |t|
      t.string :name
			t.references :parent_lvl
      t.integer :level, default: 1
      t.integer :difficulty
      t.timestamps null: false
    end
  end
end
