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

require 'rails_helper'

RSpec.describe User, type: :model do

  describe "all users validations" do

    it "is valid with minimum attributes" do
      expect(build(:user_with_mail)).to be_valid
    end

    it "is not valid without username" do
      expect(build(:user_with_mail, username: "")).to be_invalid
    end

    it "must not allow username duplication" do
      create(:user_with_mail, username: "bragnikita")
      expect(build(:user_with_mail, username: "bragnikita")).to be_invalid
    end
    it "must require for password" do
      expect(build(:user_with_mail, password: nil )).to be_invalid
      expect(build(:user_with_mail, password: "" )).to be_invalid
    end

  end

  describe "admin user validation" do
    it "must save admin user" do
      expect(create(:admin)).to be_valid
    end
    it "must require email" do
      expect(build(:admin, email: nil)).to be_invalid
    end
  end

  describe "associations" do
    subject { create(:user, :with_characters, :with_scripts, :with_character_lists) }
    it "must fetch user's characters" do
      expect(subject).to have_many(:characters)
      expect(subject.characters).to have_exactly(3).items
    end
    it "must fetch user's scripts" do
      expect(subject).to have_many(:scripts)
      expect(subject.scripts).to have_exactly(3).items
    end
    it "must fetch user's character lists" do
      expect(subject).to have_many(:character_lists)
      expect(subject.character_lists).to have_exactly(3).items
    end
  end


end
