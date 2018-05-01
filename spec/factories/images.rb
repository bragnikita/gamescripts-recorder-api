# == Schema Information
#
# Table name: images
#
#  id          :bigint(8)        not null, primary key
#  link        :string(255)
#  type        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  added_by_id :bigint(8)        not null
#
# Indexes
#
#  index_images_on_added_by_id  (added_by_id)
#
# Foreign Keys
#
#  fk_rails_...  (added_by_id => users.id)
#

FactoryBot.define do
  factory :image do

    # association :added_by, factory: :user

    after(:build) do |image|
      image.added_by = create(:admin)
    end

    factory :avatar do
      category 'character_avatar'
    end

    trait :with_attached_file do
      link File.open(File.expand_path('../images/screenshot.png', __FILE__))
    end

    factory :common_image do
      with_attached_file
    end
  end

end
