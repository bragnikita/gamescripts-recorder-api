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