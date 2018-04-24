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

FactoryBot.define do
  factory :script do
    sequence :title do |n| # генератор уникальных значений
      "script #{n}"
    end
    data "{'name': 'value'}"
    association :owner, factory: :user

    factory :script_with_characters do
      association :chara_candidates, factory: :non_empty_character_list, strategy: :build

      transient do
        characters_count 3
      end

      after(:create) do |script, evaluator|
        create_list(:character, evaluator.characters_count, scripts: [script])
      end
    end
  end



end
