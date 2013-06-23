class Post < ActiveRecord::Base
  attr_accessible :content, :title

  validates :title, presence: true, length: {minimum: 3}
  validates :content, presence: true, length: {minimum: 6}

  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_and_belongs_to_many :tags

end


