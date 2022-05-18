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
        # enable :sessions
        set :sessions, true
        set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }
        set :views, 'views'
    end

    def initialize(app = nil)
        super()
    end

    get '/' do
      redirect '/login'
    end

    post '/login' do
      User.all
      user = User.find_by(username: params["username"])
    end

    get '/login' do
        erb :login
    end

end
