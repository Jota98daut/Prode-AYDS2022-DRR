# frozen_string_literal: true

module RankingHelper
  def get_rankings
    @tournament = Tournament.find_by id: params[:tournament_id]
    @scores = Score.order(points: :desc).where(tournament: @tournament)
    erb :rankings
  end
end
