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
