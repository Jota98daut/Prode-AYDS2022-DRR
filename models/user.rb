class User < ActiveRecord::Base
    has_secure_password

    validates :username, presence: true, uniqueness: true
    validates :password, presence: true
    validates :password_confirmation, presence: true
end

class Player < User
    has_many :championbets
    has_many :bets
    has_many :scores

    def score_for(tournament_id)
        return Score.find_by(player_id: id, tournament_id: tournament_id).points
    end
end

class Admin < User
end
