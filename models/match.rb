class Match < ActiveRecord::Base
    has_many :bets
    belongs_to :home, class_name: 'Team'
    belongs_to :away, class_name: 'Team'
    belongs_to :winner, class_name: 'Team'
    belongs_to :stage
end
