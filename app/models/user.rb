class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation

  before_save  :create_remember_token
  before_save {self.email = self.email.downcase}

  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


  #validations
  validates :username, presence: true,  uniqueness: { message: " existed"}
  validates :email, format: {with: VALID_EMAIL_REGEX, 
  	message: "The Email's format is not correct"},
  	presence: true, uniqueness: true

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  public  
    def gravatar_img_src
      email_address = self.email.downcase
      hash = Digest::MD5.hexdigest(email_address)
      image_src = "http://www.gravatar.com/avatar/#{hash}"
    end     

  private 

  def create_remember_token
  	self.remember_token = SecureRandom.urlsafe_base64
  end
end
