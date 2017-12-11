class User < ActiveRecord::Base
  has_secure_password

  has_many :orders
  has_many :reviews
  has_many :sessions

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A\w+@.+\.\w+\z/, message: "must be a valid email" }
  validates :password_digest, presence: true

  def self.authenticate_with_credentials(params_for_login)
    @user = User.find_by_email(params_for_login[:email])
    if @user
      @user.authenticate(params_for_login[:password]) || @user.errors.add(:password, message: "Incorrect password")
    end
  end
end
