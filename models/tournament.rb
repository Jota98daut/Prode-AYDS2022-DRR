class Tournament < ActiveRecord::Base
    has_one :sport
    has_many :stages
end