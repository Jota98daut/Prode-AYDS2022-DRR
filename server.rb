require 'sinatra/base'
require 'bundler/setup'
require "sinatra/activerecord"

require 'sinatra/reloader' if Sinatra::Base.environment == :development

require_relative 'models/init'

class App < Sinatra::Application

  configure :development do
    register Sinatra::Reloader
    after_reload do
      puts 'Reloaded...'
    end
  end

  configure do
    enable :sessions
    set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }
    set :views, 'views'
  end

  def initialize(app = nil)
    super()
  end

  get '/' do
    if session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      "Username: #{@current_user.username}\nPassword digest: #{@current_user.password_digest}"
    else
      redirect '/login'
    end
  end

  get '/signup' do
    '<h1>Sign Up</h1>
     <p>Not yet implemented</p>'
  end

  post '/login' do
    user = User.find_by( username: params['username'] )
    if user     # if there is an user with that username
      user = user.authenticate( params['password'] )
      if user   # and the password is correct
        session[:user_id] = user.id
        redirect '/'
      else
        redirect '/login'
      end
    else
      redirect 'login'
    end
  end

  get '/login' do
    erb :login
  end

end
