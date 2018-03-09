#
# id
# fullname
# display_name
# prefixes
# avatar -> Image
# color: css_color
# scopes
# created_by -> User
#
class Character < ApplicationRecord
  with_options presence: true do |char|
    char.validates :fullname
    char.validates :display_name
  end

  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id', optional: true
end
