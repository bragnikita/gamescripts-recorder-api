# == Schema Information
#
# Table name: character_lists
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :bigint(8)        not null
#
# Indexes
#
#  index_character_lists_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id) ON DELETE => cascade
#

require 'rails_helper'

RSpec.describe CharacterList, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
