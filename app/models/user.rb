class User < ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :email, presence: true, if: :is_admin?

  has_many :characters, class_name: "Character", :dependent => :restrict_with_exception, :foreign_key => "creator_id", :inverse_of => 'creator'
end
