# frozen_string_literal: true

require 'sinatra/base'
require 'bundler/setup'
require 'sinatra/activerecord'
require 'sinatra/flash'

require 'sinatra/reloader' if Sinatra::Base.environment == :development

require_relative 'models/init'
require_relative 'helpers/helpers'

class App < Sinatra::Application
  helpers SessionHelper
  helpers LobbyHelper
  helpers SportHelper
  helpers TournamentHelper
  helpers BetHelper
  helpers StageHelper
  helpers MatchHelper
  helpers TeamHelper
  helpers RankingHelper

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

  def initialize(_app = nil)
    super()
  end

  get '/' do
    redirect_to_home
  end

  get '/lobby' do
    get_lobby
  end

  get '/admin' do
    get_admin
  end

  get '/bets' do
    get_bets
  end

  get '/bets/new' do
    get_bets_new
  end

  post '/bets' do
    post_bets
  end

  get '/signup' do
    get_signup
  end

  post '/signup' do
    post_signup
  end

  get '/logout' do
    get_logout
  end

  get '/login' do
    get_login
  end

  post '/login' do
    post_login
  end

  get '/sports' do
    get_sports
  end

  patch '/sports/:id' do
    patch_sports
  end

  post '/sports' do
    post_sports
  end

  delete '/sports/:id' do
    delete_sports
  end

  get '/tournaments' do
    get_tournaments
  end

  get '/tournaments/new' do
    get_tournaments_new
  end

  post '/tournaments' do
    post_tournaments
  end

  delete '/tournaments/:id' do
    delete_tournament
  end

  get '/tournaments/:id' do
    get_tournament
  end

  get '/stages/new' do
    get_stages_new
  end

  post '/stages' do
    post_stages
  end

  get '/stages/:id' do
    get_stage
  end

  delete '/stages/:id' do
    delete_stage
  end

  patch '/stages/:id' do
    patch_stage
  end

  get '/matches/new' do
    get_matches_new
  end

  post '/matches' do
    post_matches
  end

  get '/matches/:id' do
    get_match
  end

  get '/matches/patch/:id' do
    get_match_edit
  end

  patch '/matches/patch/:id' do
    patch_match
  end

  delete '/matches/:id' do
    delete_match
  end

  get '/matches/result/:id' do
    get_match_result
  end

  patch '/matches/result/:id' do
    patch_match_result
  end

  get '/teams' do
    get_teams
  end

  get '/teams/new' do
    get_teams_new
  end

  post '/teams' do
    post_teams
  end

  delete '/teams/:id' do
    delete_team
  end

  get '/teams/:id' do
    get_team
  end

  patch '/teams/:id' do
    patch_team
  end

  get '/info' do
    erb :'info/info'
  end

  get '/rankings/:tournament_id' do
    get_rankings
  end

  get '/user/:id' do
    get_profile
  end

  get '/user/avatar/:id' do
    patch_avatar
  end
  
  before do
    public_pages = ['/', '/login', '/signup', '/info']
    admin_pages = Regexp.union(
                  [
                   /^\/logout$/,/^\/admin$/, 
                   /^\/sports$/, /^\/sports\/(\d)+$/, 
                   /^\/tournaments$/, /^\/tournaments\/(\d)+$/, /^\/tournaments\/new$/,
                   /^\/stages$/, /^\/stages\/(\d)+$/, /^\/stages\/new$/,
                   /^\/matches$/, /^\/matches\/patch\/(\d)+$/, /^\/matches\/new$/, /^\/matches\/result\/(\d)+$/,
                   /^\/teams$/, /^\/teams\/(\d)+$/, /^\/teams\/new$/,
                  ])
    if session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      if(@current_user.type == "Player" and request.path_info.match?(admin_pages))
        redirect '/' unless request.path_info == "/logout"
      end
      if @current_user.type == "Admin"
        redirect '/' unless request.path_info.match?(admin_pages) or public_pages.include?(request.path_info)
      end
    else
      redirect '/login' unless public_pages.include?(request.path_info)
    end
  end
end
