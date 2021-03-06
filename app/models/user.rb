class User < ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :email, presence: true, if: :is_admin?

  has_many :characters, class_name: "Character", :dependent => :nullify, :foreign_key => "creator_id", :inverse_of => 'creator'
  has_many :character_lists, class_name: "CharacterList", dependent: :destroy, :inverse_of => 'owner'
  has_many :scripts, class_name: "Script", dependent: :restrict_with_error, :inverse_of => 'owner'
end
