#
# id
# fullname
# display_name
# prefixes
# avatar -> Image
# color: css_color
# scopes
# created_by -> User
#
class Character < ApplicationRecord
  with_options presence: true do |char|
    char.validates :fullname
    char.validates :display_name
  end

  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id', optional: true, :inverse_of => :characters
  belongs_to :avatar, class_name: 'Image', foreign_key: 'avatar_id', optional: true
  has_and_belongs_to_many :scripts, join_table: 'script_characters', association_foreign_key: 'scripts_id', foreign_key: 'characters_id'
  has_and_belongs_to_many :lists, class_name: 'CharacterList', join_table: 'characters_and_lists', foreign_key: 'characters_id', association_foreign_key: 'character_lists_id'
end
