class User < ActiveRecord::Base
  
  # a user has many associations with articles
  has_many :articles, dependent: :destroy
  
  # lowercase email before saving to User DB
  before_save { self.email = email.downcase }
  
  # validates username
  validates :username, presence: true, 
            uniqueness: { case_sensitive: false }, 
            length: { minumum: 1, maximum: 25 }
  
  # validates email with regex, used for gravatar
  VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
            length: { maximum: 105 }, 
            uniqueness: { case_sensitive: false }, 
            format: { with: VALID_EMAIL_REGEX }
  
  has_secure_password
end