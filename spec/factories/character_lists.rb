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

FactoryBot.define do
  factory :character_list do
    sequence :name do |n| # генератор уникальных значений
      "character list #{n}"
    end

    association :owner, factory: :user

    factory :non_empty_character_list do

    end
  end

end
