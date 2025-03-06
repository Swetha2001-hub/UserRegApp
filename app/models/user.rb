class User < ApplicationRecord
    has_secure_password
  
    validates :name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false, message: "is already taken" }, 
                      format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
    validates :age, presence: true, numericality: { greater_than_or_equal_to: 18, message: "must be at least 18 years old" }
    validates :password, length: { minimum: 6, message: "must be at least 6 characters long" }, allow_nil: true
  end
  
  