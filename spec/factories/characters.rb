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

FactoryBot.define do
  factory :character do
    sequence :fullname do |n|
      "character_#{n}"
    end
    display_name { "#{fullname} displayed" }
    prefixes "ch,Ch,CH"
    css_color "#FFFFFF"
    avatar nil

    factory :user_character do
      association :creator, factory: :user
    end
    factory :character_full do
      association :avatar, factory: :avatar

      after(:create) do |character, evaluator|
        create_list(:script, 3, characters: [character])
        create_list(:character_list, 3, characters: [character])
      end
    end
  end
end
