class Bet < ActiveRecord::Base
    has_one :player
    has_one :match
    has_one :team
end