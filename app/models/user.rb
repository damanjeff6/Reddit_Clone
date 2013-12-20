class User < ActiveRecord::Base
  attr_reader :password
  attr_accessible :password, :username

  before_validation :ensure_session_token

  has_many(
    :moderated_subs,
    :primary_key => :id,
    :foreign_key => :moderator_id,
    :class_name  => "Sub"
  )

  has_many(
    :submitted_links,
    :primary_key => :id,
    :foreign_key => :submitter_id,
    :class_name => "Link"
  )

  has_many(
    :authored_comments,
    :primary_key => :id,
    :foreign_key => :author_id,
    :class_name => "Comment"
  )

  validates :username, :password_digest, :session_token, :presence => true
  validates :password, :length => { :minimum => 6 } if :password_exists?

  def password=(plaintext)
    @password = plaintext
    self.password_digest = BCrypt::Password.create(@password)
  end

  def self.find_by_credentials(username,password)
    user = User.find_by_username(username)

    return nil if user.nil?
    return user if user.is_password?(password)

    nil
  end

  def is_password?(password)
    @password = password
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password_exists?
    !self.password.nil?
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
    self.save!
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64(16)
  end

end
