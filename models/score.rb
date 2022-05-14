class Score < ActiveRecord::Base
  belongs_to :player
  belongs_to :tournament

  def points
    acum = 0
    bets = player.bets.select { |bet| bet.match.stage.tournament == tournament }
    bets.each { |bet| acum = acum + bet.points }
    return acum
  end
end
