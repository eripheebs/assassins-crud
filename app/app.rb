ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'data_mapper_setup'
require 'sinatra/auth/github'
require 'dotenv'
Dotenv.load

require 'rest-client'
require 'json'

CLIENT_ID = ENV['GH_BASIC_CLIENT_ID']
CLIENT_SECRET = ENV['GH_BASIC_SECRET_ID']

require_relative 'server'

require_relative 'controllers/static_pages'
require_relative 'controllers/user_auth'
