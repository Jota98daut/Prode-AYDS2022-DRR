class Tournament < ActiveRecord::Base
    has_one :sport
    has_many :stages
    has_many :championbets
end