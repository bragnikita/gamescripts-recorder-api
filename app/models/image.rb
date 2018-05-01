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

class Image < ApplicationRecord

  mount_uploader :link, ImagesUploader

  belongs_to :added_by, class_name: "User", optional: false

  after_initialize :set_defaults

  private

  def set_defaults
    self.category = 'common' if self.category.nil?
  end
end
