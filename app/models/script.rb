# == Schema Information
#
# Table name: scripts
#
#  id                  :bigint(8)        not null, primary key
#  data                :text(65535)
#  title               :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  chara_candidates_id :bigint(8)
#  owner_id            :bigint(8)
#
# Indexes
#
#  index_scripts_on_chara_candidates_id  (chara_candidates_id)
#  index_scripts_on_owner_id             (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (chara_candidates_id => character_lists.id) ON DELETE => nullify
#  fk_rails_...  (owner_id => users.id) ON DELETE => nullify
#

# id
# title
# script_data
# characters <-> Character //фактически добавленные
# candidate_list -> CharacterList //добавленные юзером в кандидаты
# owner -> User
# scopes

class Script < ApplicationRecord
  belongs_to :owner, class_name: 'User', optional: false, inverse_of: 'scripts'
  belongs_to :chara_candidates, class_name: 'CharacterList', optional: true
  has_and_belongs_to_many :characters, join_table: 'script_characters', association_foreign_key: "characters_id", foreign_key: 'scripts_id'
end
