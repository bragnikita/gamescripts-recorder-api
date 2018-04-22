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