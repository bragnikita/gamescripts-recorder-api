# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  email      :string(50)
#  is_active  :boolean          default(TRUE)
#  is_admin   :boolean          default(FALSE)
#  password   :string(50)
#  username   :string(50)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  avatar_id  :bigint(8)
#
# Indexes
#
#  index_users_on_avatar_id  (avatar_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (avatar_id => images.id)
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :email, presence: true, if: :is_admin?

  has_many :characters, class_name: "Character", :dependent => :nullify, :foreign_key => "creator_id", :inverse_of => 'creator'
  has_many :character_lists, class_name: "CharacterList", dependent: :destroy, :inverse_of => 'owner', :foreign_key => 'owner_id'
  has_many :scripts, class_name: "Script", dependent: :restrict_with_error, :inverse_of => 'owner', :foreign_key => 'owner_id'
end
