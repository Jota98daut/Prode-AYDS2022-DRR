class Tournament < ActiveRecord::Base
    belongs_to :sport
    has_many :stages
    has_many :championbets
end
