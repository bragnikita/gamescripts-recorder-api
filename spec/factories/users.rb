FactoryBot.define do
  factory :user do
    sequence :username do |n| # генератор уникальных значений
      "bragnikita_#{n}"
    end
    password "JIjo321fds"
    is_admin false
    is_active true
    email "aaa@example.com"

    factory :user_with_mail do
      email "aaa@example.com"
    end

    factory :admin do
      email "aaa@example.com"
      is_admin true
    end

    trait :with_characters do
      after(:create) do |user, evaluator|
        create_list(:character, 3, creator: user)
      end
    end

    trait :with_scripts do
      after(:create) do |user, evaluator|
        create_list(:script, 3, owner: user)
      end
    end

    trait :with_character_lists do
      after(:create) do |user, evaluator|
        create_list(:character_list, 3, owner: user)
      end
    end

  end

end