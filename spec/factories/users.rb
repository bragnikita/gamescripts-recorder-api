# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  avatar     :string(255)
#  email      :string(50)
#  is_active  :boolean          default(TRUE)
#  is_admin   :boolean          default(FALSE)
#  password   :string(50)
#  username   :string(50)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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
