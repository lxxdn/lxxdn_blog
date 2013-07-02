class Comment < ActiveRecord::Base
  attr_accessible :content, :user_id, :post_id

  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :content, length: {minimum: 3}

  belongs_to :post
  belongs_to :user
end
