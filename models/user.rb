class User < ActiveRecord::Base
end

class Player < User
    has_many :championbets
    has_many :bets
    has_many :scores
end
