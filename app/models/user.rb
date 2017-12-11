class User < ActiveRecord::Base
  has_secure_password

  has_many :orders
  has_many :reviews
  has_many :sessions

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A\w+@.+\.\w+\z/, message: "must be a valid email" }
  validates :password_digest, presence: true
  before_save :downcase_email

  def self.authenticate_with_credentials(params_for_login)
    @user = User.find_by_email(params_for_login[:email].downcase.strip)
    if @user
      @user.authenticate(params_for_login[:password]) || @user.errors.add(:password, message: "Incorrect password")
    end
  end

  def downcase_email
    self.email.downcase!
  end
end
