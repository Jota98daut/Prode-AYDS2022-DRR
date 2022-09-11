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
end

class Admin < User
end
