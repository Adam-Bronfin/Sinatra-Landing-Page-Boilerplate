require 'data_mapper'
require 'pg'
require 'dm-core'
require 'dm-migrations'
require 'dm-postgres-adapter'

configure :production do
  DataMapper.setup(:default, ENV['DATABASE_URL'])
end

configure :development do
  DataMapper.setup(:default, "sqlight3://#{Dir.pwd}/development")
end

class User
  include DataMapper::Resource

  property :id, Serial, key: true
  property :email, String, length: 128
  property :registered_on, DateTime
end

DataMapper.finalize