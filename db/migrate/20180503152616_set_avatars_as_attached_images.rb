class SetAvatarsAsAttachedImages < ActiveRecord::Migration[5.1]
  def change
    remove_reference :users, :avatar, foreign_key: {to_table: :images}
    add_column :users, :avatar, :string

    remove_reference :characters, :avatar, foreign_key: {to_table: :images}
    add_column :characters, :avatar, :string
  end
end
