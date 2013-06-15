class Post < ActiveRecord::Base
  attr_accessible :content, :title

  validates :title, presence: true, length: {minimum: 3}
  validates :content, presence: true, length: {minimum: 6}

end


