class CreateCharacterLists < ActiveRecord::Migration[5.1]
  def change
    create_table :character_lists do |t|

      t.timestamps
    end
  end
end
