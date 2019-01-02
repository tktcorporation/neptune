class User < ApplicationRecord
  has_secure_password validations: false
  has_secure_token :auth_token
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false },
                    lt4bytes: true
  validates :password_digest, presence: true, lt4bytes: true
  validates :password, presence: true, length: { in: 8..32 }, format: { with: /\A[a-z0-9]+\z/i }, allow_blank: true

  def refresh_token
    self.regenerate_auth_token
    self.expiration_date = Time.now + 60*60
    self.save!
  end

  def self.auth_with_token(auth_token)
    user = User.find_by(auth_token: auth_token)
    user && user.expiration_date > Time.now ? user : false
  end

end