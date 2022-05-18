class User < ActiveRecord::Base
    has_secure_password
end

class Player < User
    has_many :championbets
    has_many :bets
    has_many :scores
end

class Admin < User
end
