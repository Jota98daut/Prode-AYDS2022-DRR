class ChampionBet < ActiveRecord::Base
    belongs_to :player
    belongs_to :team
    belongs_to :tournament
end
