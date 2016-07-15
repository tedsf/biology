class User < ActiveRecord::Base
  validates_presence_of :username, :email, :password
  validates :username, uniqueness: { case_sensitive: false }
  validates :email, uniqueness: { case_sensitive: false }
  validates_length_of :username, minimum: 3, maximum: 30, message: "username must be between 3 and 30 characters"
  validates_length_of :email, minimum: 7, message: "email must be at least 7 characters"
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email must be valid"

  has_secure_password

end
