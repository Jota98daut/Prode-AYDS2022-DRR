class Team < ActiveRecord::Base
    has_one :country
    has_many :championbet
    has_many :matches
    has_many :bets
    has_many :won_matches, class_name: 'Match'
end