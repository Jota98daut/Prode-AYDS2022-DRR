# frozen_string_literal: true

module TournamentHelper
  def get_tournaments
    @tournaments = Tournament.all
    erb :'tournaments/index'
  end

  def get_tournaments_new
    @sports = Sport.all
    erb :'tournaments/new'
  end

  def post_tournaments
    t = Tournament.create(name: params[:name], sport: Sport.find_by(name: params[:sport]))
    Player.all.each do |player|
      Score.create(points: 0, player: player, tournament: t)
    end
    redirect '/tournaments'
  end

  def delete_tournament
    Tournament.find_by_id(params[:id]).destroy
    redirect '/tournaments'
  end

  def get_tournament
    @tournament = Tournament.find_by(id: params[:id])
    @stages = Stage.where(tournament: @tournament)
    erb :'tournaments/edit'
  end
end
