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

  get '/sports' do
    @sports = Sport.all
    erb :'sports/manage_sports'
  end

  patch '/sports/:id' do
    Sport.find_by(id: params[:id]).update(name: params[:new_name])
    redirect '/sports'
  end

  post '/sports' do
    Sport.create( name: params[:name] )
    redirect '/sports'
  end

  delete '/sports/:id' do
    Sport.find_by(id: params[:id]).destroy
    redirect '/sports'
  end

  get '/tournaments' do
    @tournaments = Tournament.all
    erb :'tournaments/manage_tournaments'
  end

  get '/tournaments/new' do
    @sports = Sport.all
    erb :'tournaments/add_tournaments'
  end

  post '/tournaments' do
    Tournament.create(name: params[:name], sport: Sport.find_by(name: params[:sport]))
    redirect '/tournaments'
  end

  delete '/tournaments/:id' do
    Tournament.find_by_id(params[:id]).destroy
    redirect '/tournaments'
  end

  get '/tournaments/:id' do
    @tournament = Tournament.find_by(id: params[:id])
    @stages = Stage.where(tournament: @tournament)
    erb :'tournaments/modify_tournaments'
  end

  get '/stages/new' do
    @tournament = Tournament.find_by(id: params[:tournament_id])
    erb :'stages/add_stages'
  end

  post '/stages' do
    Stage.create(params)
    redirect '/tournaments?id=' + params[:tournament_id]
  end

  get '/stages/:id' do
    @stage = Stage.find_by(id: params[:id])
    erb :'stages/modify_stage'
  end

  delete '/stages/:id' do
    stage = Stage.find_by(id: params[:id])
    tournament = stage.tournament
    stage.destroy
    redirect "/tournaments/#{stage.tournament_id}"
  end

  patch '/stages/:id' do 
    stage = Stage.find_by(id: params[:id])

    if params[:penalties] == "Yes"
      stage.update(name: params[:name], penalties: true)
    else
      stage.update(name: params[:name], penalties: false)
    end

    redirect "/tournaments/#{stage.tournament_id}"
  end

  get '/matches/new' do
    @teams = Team.all
    tournament = Tournament.find_by(id: params[:tournament_id])
    @stages = tournament.stages
    erb :'matches/add_matches'
  end

  post '/matches' do
    match = Match.new
    match.stage = Stage.find_by(name: params[:stage_name])
    match.date = params[:date]
    match.time = params[:time]
    match.home = Team.find_by(name: params[:home_name])
    match.away = Team.find_by(name: params[:away_name])
    match.save

    redirect "/tournaments/" + params[:tournament_id]
  end

  get '/matches/:id' do
    @match = Match.find_by(id: params[:id])
    @teams = Team.all
    erb :'matches/modify_matches'
  end

  patch '/matches/:id' do
    match = Match.find_by(id: params[:id])
    match.date = params[:date]
    match.time = params[:time]
    match.home = Team.find_by(name: params[:home_name])
    match.away = Team.find_by(name: params[:away_name])
    match.save

    redirect "/tournaments/" + match.stage.tournament_id
  end

  delete '/matches' do
    match = Match.find_by(id: params[:id])
    tournament = match.stage.tournament
    match.destroy
    redirect "/tournaments/#{match.stage.tournament_id}"
  end

  get '/teams' do
    @teams = Team.all
    erb :'teams/manage_teams'
  end

  get '/teams/new' do
    @countries = Country.all
    erb :'teams/add_teams'
  end

  post '/teams' do 
    team = Team.new
    team.name = params[:name]
    team.country = Country.find_by(name: params[:country])
    team.save

    redirect "/teams"
  end

  delete '/teams/:id' do
    Team.find_by(id: params[:id]).destroy

    redirect '/teams'
  end

  get '/teams/:id' do 
    @countries = Country.all
    @team = Team.find_by(id: params[:id])
    erb :'teams/modify_teams'
  end

  patch '/teams/:id' do
    team = Team.find_by(id: params[:id])
    team.name = params[:name]
    team.country = Country.find_by(name: params[:country])
    team.save

    redirect "/teams"
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
