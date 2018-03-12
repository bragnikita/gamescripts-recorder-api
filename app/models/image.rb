class Image < ApplicationRecord

  belongs_to :added_by, class_name: :user, foreign_key: true, optional: true
end
