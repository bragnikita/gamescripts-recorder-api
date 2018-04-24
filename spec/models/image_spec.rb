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

require 'rails_helper'

RSpec.describe Image, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
