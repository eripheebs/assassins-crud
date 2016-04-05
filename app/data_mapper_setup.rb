require_relative 'models/user'
require_relative 'models/assignment'
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/assassins_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
