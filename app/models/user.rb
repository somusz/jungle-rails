class User < ActiveRecord::Base
  #requiring bcrypt method
  has_secure_password

  #relationships with orders, reviews, sessions
  has_many :orders
  has_many :reviews
  has_many :sessions

  #has to have first and last names to be valid
  validates :first_name, presence: true
  validates :last_name, presence: true
  #email must exist, be unique - case insensitive, must match the below pattern
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A\w+@.+\.\w+\z/, message: "must be a valid email" }
  #password is saved as a hash and must exist
  validates :password_digest, presence: true
  #email stored downcase
  before_save :downcase_email

  #helper to authenticate users
  def self.authenticate_with_credentials(params_for_login)
    #lookup user by lowcase email
    @user = User.find_by_email(params_for_login[:email].downcase.strip)
    #if found, authenticate password or return an error message
    if @user
      @user.authenticate(params_for_login[:password]) || @user.errors.add(:password, message: "Incorrect password")
    end
  end

  #helper for turning email to lowcase
  def downcase_email
    self.email.downcase!
  end
end
