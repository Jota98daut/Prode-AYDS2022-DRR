class ChampionBet < ActiveRecord::Base
    has_one :player
    has_one :team
    has_one :tournament
end