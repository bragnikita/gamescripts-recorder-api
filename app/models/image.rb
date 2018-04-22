# id
# link: string
# type: string
class Image < ApplicationRecord

  belongs_to :added_by, class_name: "User", optional: false
end
