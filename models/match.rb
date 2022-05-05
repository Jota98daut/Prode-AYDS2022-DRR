class Match < ActiveRecord::Base
    has_many :bets
    has_one :team # participant 1
    has_one :team # participant 2
    has_one :team # winner
    belongs_to :stage
end