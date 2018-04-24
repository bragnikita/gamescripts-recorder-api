# == Schema Information
#
# Table name: scripts
#
#  id                  :bigint(8)        not null, primary key
#  data                :text(65535)
#  title               :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  chara_candidates_id :bigint(8)
#  owner_id            :bigint(8)
#
# Indexes
#
#  index_scripts_on_chara_candidates_id  (chara_candidates_id)
#  index_scripts_on_owner_id             (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (chara_candidates_id => character_lists.id) ON DELETE => nullify
#  fk_rails_...  (owner_id => users.id) ON DELETE => nullify
#

require 'rails_helper'

RSpec.describe Script, type: :model do
  describe "associations" do
    subject { create(:script_with_characters ) }

    it "must fetch owner" do
      expect(subject.owner).not_to be_nil
    end
    it "must fetch character candidates of script" do
      expect(subject.chara_candidates).not_to be_nil
    end
    it "must fetch actual scripts characters" do
      expect(subject.characters).to have_exactly(3).items
    end

  end
end
