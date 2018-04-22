FactoryBot.define do
  factory :image do

    # association :added_by, factory: :user

    after(:build) do |image|
      image.added_by = create(:admin)
    end

    factory :avatar do
      type 'character_avatar'
    end
  end

end