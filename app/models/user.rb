require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_format_of :email, as: :email_address
  validates_confirmation_of :password
  validates_uniqueness_of :email

  property :id, Serial
  property :username, String, required: true, unique: true
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, Text

  def password=(password)
  @password = password
  self.password_digest = BCrypt::Password.create(password)
  end

  def authenticate(attempted_password)
    if BCrypt::Password.new(self.password_digest) == attempted_password
      true
    else
      false
    end
  end

end
