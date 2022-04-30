require 'sinatra/base'
require 'bundler/setup'
require "sinatra/activerecord"

require 'sinatra/reloader' if Sinatra::Base.environment == :development

class User
    def initialize(username,password)
        @username = username
        @password = password
    end
    attr_accessor :username,:password
end

class App < Sinatra::Application

    configure :development do
        register Sinatra::Reloader
        after_reload do
            puts 'Reloaded...'
        end
    end

    configure do
        set :views, 'views'
    end

    def initialize(app = nil)
        super()
    end

    get '/' do
      'Hello World!'
    end
    
    users = [User.new("joel","1234")];

    post '/login' do
        users.to_s
        # usr = User.new(params['username'],params['password'])
        # users.push(usr)
    end

    get '/login' do
        erb :login
    end

end
