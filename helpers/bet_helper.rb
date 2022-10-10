# frozen_string_literal: true

module BetHelper
  def get_bets
    @tournament = Tournament.find_by id: params[:tournament_id]
    @score = @tournament.scores.find_by(player: @current_user)
    @bets = Bet.where(player: @current_user)
    @bets = @bets.filter { |bet| bet.match.stage.tournament == @tournament }
    erb :'bets/index'
  end

  def get_bets_new
    @tournament = Tournament.find_by id: params[:tournament_id]
    @score = @tournament.scores.find_by player: @current_user
    @bets = Bet.where(player: @current_user)
    @matches = []
    @bets.each do |b|
      @matches.push(b.match)
    end
    erb :'bets/new'
  end

  def post_bets
    winner = params[:winner]
    match = Match.find_by(id: params[:match_id])
    bet = Bet.new(match: match, player: @current_user)
    bet.draw = (winner == 'draw' or params[:penalties])
    bet.team_id = winner
    bet.save

    redirect "/bets?tournament_id=#{match.stage.tournament.id}"
  end
end
