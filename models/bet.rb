class Bet < ActiveRecord::Base
    belongs_to :team
    belongs_to :match
    belongs_to :player

    validates :match, presence: true
    validates :player, presence: true

    def points
      acum = 0
      if draw then
        if match.draw then acum = acum+1 end
      end
      if team then
        if team == match.winner then acum+1 end
      end
    end
end
