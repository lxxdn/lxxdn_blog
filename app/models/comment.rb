class Comment < ActiveRecord::Base
  attr_accessible :content

  belongs_to :author, class_name: "User", foreign_key: "user_id"
end
