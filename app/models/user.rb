class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation

  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


  #validations
  validates :username, presence: true,  uniqueness: true
  validates :email, format: {with: VALID_EMAIL_REGEX, 
  	message: "The Email's format is not correct"},
  	presence: true, uniqueness: true

  has_many :posts, dependent: :destroy
end
