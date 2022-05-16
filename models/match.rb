class Match < ActiveRecord::Base
    has_many :bets
    belongs_to :home, class_name: 'Team'
    belongs_to :away, class_name: 'Team'
    belongs_to :winner, class_name: 'Team'
    belongs_to :stage
    
    validates :home, presence: true
    validates :away , presence: true
    validates :stage , presence: true

    before_update :calculate_points, if: :result_charged?

    def result_charged? 
        return draw.present? || winner.present?
    end

    private
      def calculate_points 
        t = stage.tournament
        bets.each do |bet|  
            player_score = (bet.player.scores.select {|score| score.tournament == t}).first
            player_score.points = player_score.points + bet.points
        end
      end
end