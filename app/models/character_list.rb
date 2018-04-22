class CharacterList < ApplicationRecord
  validates :name, presence: true

  has_and_belongs_to_many :characters, join_table: 'characters_and_lists', foreign_key: 'character_lists_id', association_foreign_key: 'characters_id'
  belongs_to :owner, class_name: 'User', optional: false, inverse_of: 'character_lists'
end
