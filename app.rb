require 'rubygems'
require 'sinatra'

configure do
  enable :sessions
end

helpers do
  def flash_types
    [:success, :notice, :warning, :error]
  end
end


get '/' do
  erb :landing
end
get '/signup' do
  erb :signup
end


post '/' do
  @user = User.create(
      :email => params['user']['email'],
      :registered_on => Time.now
  )
  @signup_success = true
  erb :signup_success
end


