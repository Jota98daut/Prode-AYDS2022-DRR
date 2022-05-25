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
    set :public_folder, 'public'
  end

  def initialize(app = nil)
    super()
  end

  get '/' do
    if session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      if @current_user.type == 'Admin'
        redirect '/admin'
      else
        redirect '/lobby'
      end
    else
      redirect '/login'
    end
  end

  get '/lobby' do
    erb :'users/lobby'
  end

  get '/signup' do
   erb :'users/signup'
  end

  post '/signup' do
    player = Player.new( params )
    if player.save
      session[:user_id] = player.id
      redirect '/'
    else
      redirect '/signup'
    end
  end

  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    user = User.find_by username: params['username']
    if user     # if there is an user with that username
      user = user.authenticate params['password']
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

  get '/admin' do
    erb :'users/admin'
  end

  get '/manage_sports' do
    @sports = Sport.all
    erb :'sports/manage_sports'
  end

  post '/add_sport' do
    Sport.create( name: params['name'] )
    redirect '/manage_sports'
  end

  post '/delete_sport' do
    Sport.find_by(id: params['id']).destroy
    redirect '/manage_sports'
  end

  get '/manage_tournaments' do
    @tournaments = Tournament.all
    erb :'tournaments/manage_tournaments'
  end

  get '/add_tournaments' do
    @sports = Sport.all
    erb :'tournaments/add_tournaments'
  end

  post '/add_tournaments' do
    Tournament.create(name: params['name'], sport: Sport.find_by(name: params['sport']))
    redirect '/manage_tournaments'
  end

  post '/manage_tournaments' do
    Tournament.find_by_name(params['name']).destroy
    redirect '/manage_tournaments'  
  end

  get '/modify_tournaments' do
    t = Tournament.find_by(name: params['name'])
    @stages = Stage.where(tournament: t)
    erb :'tournaments/modify_tournaments'
  end

  get '/modify_stages' do
    @stage = Stage.find_by(id: params['id'])
    erb :modify_stage
  end

  post '/modify_stages' do 
    stage = Stage.find_by(id: params['id'])

    if params['penalties'] == "Yes"
      stage.update(name: params['name'], penalties: true)
    else
      stage.update(name: params['name'], penalties: false)
    end

    redirect "/modify_tournaments?name=#{stage.tournament.name}"
  end

  before do
    if session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
    else
      public_pages = ["/", "/login", "/signup"]
      if !public_pages.include?(request.path_info)
        redirect '/login'
      end
    end
  end
end
