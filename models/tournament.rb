class User < ActiveRecord::Base
    has_one :sport
    has_many :stage
end