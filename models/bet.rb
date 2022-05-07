class Bet < ActiveRecord::Base
    belongs_to :team
    belongs_to :match
    belongs_to :player
end
