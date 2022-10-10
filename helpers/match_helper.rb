# frozen_string_literal: true

module MatchHelper
  def get_matches_new
    @teams = Team.all
    tournament = Tournament.find_by(id: params[:tournament_id])
    @stages = tournament.stages
    erb :'matches/new'
  end

  def post_matches
    match = Match.new
    tournament_id = params[:tournament_id]

    match.set_params(params)
    if match.save
      redirect "/tournaments/#{tournament_id}"
    end

    flash[:warning] = 'teams must be different'
    redirect "/matches/new?tournament_id=#{tournament_id}"
  end

  def get_match
    @match = Match.find_by(id: params[:id])
    @teams = Team.all
    erb :'matches/edit'
  end

  def patch_match
    match = Match.find_by(id: params[:id])
    match.set_params(params)
    match.save

    redirect "/tournaments/#{match.stage.tournament_id}"
  end

  def delete_match
    match = Match.find_by(id: params[:id])
    tournament = match.stage.tournament
    match.destroy
    redirect "/tournaments/#{match.stage.tournament_id}"
  end

  def get_match_result
    @match = Match.find_by id: params[:id]
    erb :'/matches/result'
  end

  def patch_match_result
    match = Match.find_by id: params[:id]
    if params[:winner] == 'draw'
      match.draw = true
    else
      match.winner_id = params[:winner]
    end

    match.draw = true if params[:penalties]

    match.save
    redirect "/tournaments/#{match.stage.tournament_id}"
  end
end
