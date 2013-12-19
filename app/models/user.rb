class User < ActiveRecord::Base
  attr_reader :password
  attr_accessible :password, :username

  validates :username, :password_digest, :session_token, :presence => true
  validates :password, :length => { :minimum => 6 } if :password_exists?

  def password=(plaintext)
    @password = plaintext
    self.password_digest = BCrypt::Password.create(@password)
  end
end
