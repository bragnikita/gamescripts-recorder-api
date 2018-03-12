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
  has_and_belongs_to_many :characters, join_table: 'script_characters'
end
