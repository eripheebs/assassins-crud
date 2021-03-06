class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String, required: true, unique: true
  property :email, String, format: :email_address, required: true, unique: true
  property :bio, Text

end
