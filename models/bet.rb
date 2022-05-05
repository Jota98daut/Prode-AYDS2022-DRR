class Bet < ActiveRecord::Base
    has_one :team
    has_one :match
    has_one :player
end