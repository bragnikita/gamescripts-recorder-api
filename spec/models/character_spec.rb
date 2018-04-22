require 'rails_helper'

RSpec.describe Character, type: :model do
  describe "associations" do

    subject { create(:character_full)}

    it "created by bragnikita" do
      character = create(:user_character)
      expect(character).to belong_to(:creator)
      expect(character.creator).to_not be_nil
    end

    it "can fetch avatar" do
      expect(subject).to belong_to(:avatar)
      expect(subject).not_to be_nil
    end
    it "can belongs many lists" do
      # expect(subject).to have_and_belongs_to_many :lists
      expect(subject.lists).not_to be_nil
      expect(subject.lists).to have_exactly(3).items
    end
    it "can take part in many scripts" do
      # expect(subject).to have_and_belongs_to_many :scripts
      expect(subject.scripts).not_to be_nil
      expect(subject.scripts).to have_exactly(3).items
    end

  end
end
