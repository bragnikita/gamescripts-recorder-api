# == Schema Information
#
# Table name: characters
#
#  id           :bigint(8)        not null, primary key
#  css_color    :string(255)
#  display_name :string(255)
#  fullname     :string(255)
#  prefixes     :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  avatar_id    :bigint(8)
#  creator_id   :bigint(8)
#
# Indexes
#
#  index_characters_on_avatar_id   (avatar_id)
#  index_characters_on_creator_id  (creator_id)
#
# Foreign Keys
#
#  fk_rails_...  (avatar_id => images.id)
#  fk_rails_...  (creator_id => users.id) ON DELETE => nullify
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
