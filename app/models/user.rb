class User < ActiveRecord::Base
  has_many :articles
  has_many :likes
  before_save { self.email = email.downcase }
  validates :username, presence:true, length: { minimum: 4, maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:true, length: { maximum: 150 },
                                   uniqueness: { case_sensitive: false },
                                   format: { with: VALID_EMAIL_REGEX }
  validates :first_name, presence:true, length: { minimum: 2, maximum: 30 }
  validates :last_name, presence:true, length: { minimum: 2, maximum: 30 }
  has_secure_password
end