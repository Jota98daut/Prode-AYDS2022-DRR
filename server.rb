require 'sinatra/base'
require 'bundler/setup'
require "sinatra/activerecord"

require 'sinatra/reloader' if Sinatra::Base.environment == :development

require_relative 'models/user'

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
    end
  end
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
    
    users = [];

    post '/login' do
        users.to_s
        # usr = User.new(params['username'],params['password'])
        # users.push(usr)
    end

    get '/login' do
        erb :login
    end

end
