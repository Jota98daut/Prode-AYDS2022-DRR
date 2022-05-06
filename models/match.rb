class Match < ActiveRecord::Base
    has_many :bets
    has_one :home_team, class_name: 'Team'
    has_one :away_team, class_name: 'Team'
    has_one :winner_team, class_name: 'Team'
    belongs_to :stage
end