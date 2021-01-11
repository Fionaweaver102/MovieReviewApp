class User < ActiveRecord::Base 
  has_secure_password
  validates_presence_of :username, :password_digest
  validates_uniqueness_of :username
  has_many :reviews
end 