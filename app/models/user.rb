class User < ActiveRecord::Base

  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, presence:true, length: { minimum: 6 }
  validates :password_confirmation, presence:true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email.strip.downcase ).try(:authenticate, password)
  end
end