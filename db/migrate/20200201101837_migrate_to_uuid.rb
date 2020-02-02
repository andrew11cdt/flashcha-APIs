class MigrateToUuid < ActiveRecord::Migration[6.0]
  def up
    add_column :levels, :uuid, :uuid, null: false, default: -> { "gen_random_uuid()" }
    add_column :languages, :uuid, :uuid, null: false, default: -> { "gen_random_uuid()" }
    add_column :courses, :uuid, :uuid, null: false, default: -> { "gen_random_uuid()" }
    add_column :lessons, :uuid, :uuid, null: false, default: -> { "gen_random_uuid()" }
    add_column :flash_cards, :uuid, :uuid, null: false, default: -> { "gen_random_uuid()" }
    add_column :card_translations, :uuid, :uuid, null: false, default: -> { "gen_random_uuid()" }
    
    # add UUID for associations
    add_column :levels, :parent_lvl_uuid, :uuid
    
    add_column :courses, :level_uuid, :uuid
    add_column :courses, :language_uuid, :uuid
    
    add_column :lessons, :course_uuid, :uuid
    

    add_column :flash_cards, :lesson_uuid, :uuid
    
    add_column :card_translations, :flash_card_uuid, :uuid
    add_column :card_translations, :language_uuid, :uuid

    # Populate UUID columns for associations
    # UPDATE comments SET user_uuid = users.uuid FROM users WHERE comments.user_id = users.id;
    execute <<-SQL
      UPDATE courses SET level_uuid = levels.uuid FROM levels WHERE courses.level_id = levels.id;
      UPDATE courses SET language_uuid = languages.uuid FROM languages WHERE courses.language_id = languages.id;

      UPDATE lessons SET course_uuid = courses.uuid FROM courses WHERE lessons.course_id = courses.id;
      UPDATE flash_cards SET lesson_uuid = lessons.uuid FROM lessons WHERE flash_cards.lesson_id = lessons.id;

      UPDATE card_translations SET flash_card_uuid = flash_cards.uuid FROM flash_cards WHERE card_translations.flash_card_id = flash_cards.id;
      UPDATE card_translations SET language_uuid = languages.uuid FROM languages WHERE card_translations.language_id = languages.id;
    SQL

    # Migrate UUID to ID for associations

    remove_column :levels, :parent_lvl_id
    rename_column :levels, :parent_lvl_uuid, :parent_lvl_id
    
    remove_column :courses, :level_id
    rename_column :courses, :level_uuid, :level_id

    remove_column :courses, :language_id
    rename_column :courses, :language_uuid, :language_id
    
    remove_column :lessons, :course_id
    rename_column :lessons, :course_uuid, :course_id
    

    remove_column :flash_cards, :lesson_id
    rename_column :flash_cards, :lesson_uuid, :lesson_id
    
    remove_column :card_translations, :flash_card_id
    rename_column :card_translations, :flash_card_uuid, :flash_card_id

    remove_column :card_translations, :language_id
    rename_column :card_translations, :language_uuid, :language_id

    # Add indexes for associations
    add_index :courses, :level_id
    add_index :courses, :language_id

    add_index :lessons, :course_id

    add_index :flash_cards, :lesson_id
    
    add_index :card_translations, :flash_card_id
    add_index :card_translations, :language_id

    # Migrate primary keys from UUIDs to IDs
    remove_column :courses,    :id
    remove_column :lessons,    :id
    remove_column :flash_cards,    :id
    remove_column :card_translations,    :id

    remove_column :levels,    :id
    remove_column :languages,    :id

    rename_column :levels, :uuid,    :id
    rename_column :languages, :uuid,    :id
    
    rename_column :courses, :uuid, :id
    rename_column :lessons, :uuid, :id
    rename_column :flash_cards, :uuid, :id
    rename_column :card_translations, :uuid, :id
    
    execute "ALTER TABLE levels            ADD PRIMARY KEY (id);"
    execute "ALTER TABLE languages            ADD PRIMARY KEY (id);"
    execute "ALTER TABLE courses            ADD PRIMARY KEY (id);"
    execute "ALTER TABLE lessons            ADD PRIMARY KEY (id);"
    execute "ALTER TABLE flash_cards        ADD PRIMARY KEY (id);"
    execute "ALTER TABLE card_translations  ADD PRIMARY KEY (id);"
    
    # Add foreign keys
    add_foreign_key :courses, :levels
    add_foreign_key :courses, :languages

    add_foreign_key :lessons, :courses

    add_foreign_key :flash_cards, :lessons

    add_foreign_key :card_translations, :flash_cards
    add_foreign_key :card_translations, :languages

    # Add indexes for ordering by date
    add_index :courses,    :created_at
    add_index :lessons,    :created_at
    add_index :flash_cards,    :created_at
    add_index :card_translations,    :created_at
  end
end
