class CreateMainTables < ActiveRecord::Migration[5.1]
  def change

    create_table :images do |t|
      t.string :link
      t.string :category
      t.timestamps
    end

    create_table :users do |t|
      t.string :username, limit: 50
      t.string :password, limit: 50
      t.string :email, limit: 50
      t.boolean :is_admin, default: 0
      t.boolean :is_active, default: 1
      t.timestamps
    end
    add_reference :users, :avatar, references: :images, null: true, foreign_key: {to_table: :images}, index: { unique: true }

    add_reference :images, :added_by, references: :users, null: false, foreign_key: {to_table: :users}

    create_table :characters do |t|
      t.string :fullname
      t.string :display_name
      t.string :prefixes
      t.string :css_color
      t.timestamps
    end
    add_reference :characters, :creator, references: :users, null: true, foreign_key: {to_table: :users, on_delete: :nullify}, index: true
    add_reference :characters, :avatar, references: :images, null: true, foreign_key: {to_table: :images}

    create_table :character_lists do |t|
      t.string :name
      t.timestamps
    end
    add_reference :character_lists, :owner, references: :users, null: false, foreign_key: {to_table: :users, on_delete: :cascade}, index: true

    create_table :characters_and_lists, id: false do |t|
      t.belongs_to :character_lists, index: true, foreign_key: true
      t.belongs_to :characters, index: true, foreign_key: true
    end

    create_table :scripts do |t|
      t.string :title
      t.text :data
      t.timestamps
    end
    add_reference :scripts, :owner, references: :users, null: true, foreign_key: {to_table: :users, on_delete: :nullify}, index: true
    add_reference :scripts, :chara_candidates, references: :character_lists, null: true, foreign_key: {to_table: :character_lists, on_delete: :nullify}, index: true

    create_table :script_characters, id: false do |t|
      t.belongs_to :scripts, index: true, foreign_key: true
      t.belongs_to :characters, index: true, foreign_key: true
    end

  end
end
