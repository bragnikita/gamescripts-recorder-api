# == Schema Information
#
# Table name: character_lists
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :bigint(8)        not null
#
# Indexes
#
#  index_character_lists_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id) ON DELETE => cascade
#

class CharacterList < ApplicationRecord
  validates :name, presence: true

  has_and_belongs_to_many :characters, join_table: 'characters_and_lists', foreign_key: 'character_lists_id', association_foreign_key: 'characters_id'
  belongs_to :owner, class_name: 'User', optional: false, inverse_of: 'character_lists'
end
