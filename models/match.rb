class Match < ActiveRecord::Base
    has_many :bets
    belongs_to :home, class_name: 'Team'
    belongs_to :away, class_name: 'Team'
    belongs_to :winner, class_name: 'Team'
    belongs_to :stage
    
    validates :home, presence: true
    validates :away, presence: true
    validates :stage, presence: true
    validates :home, comparison: { other_than: :away }

    after_update :calculate_points, if: :result_charged?

    def result_charged? 
        return draw.present? || winner.present?
    end

    def calculate_points 
      t = stage.tournament 
      bets.each do |bet| 
          player_score = (bet.player.scores.select {|score| score.tournament == t}).first
          new_points = bet.calculate_points
          bet.update( points: new_points ) 
          player_score.update( points: player_score.points + new_points ) 
      end
    end
end
