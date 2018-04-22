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