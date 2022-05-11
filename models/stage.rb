class Stage < ActiveRecord::Base
    belongs_to :tournament
    has_many :matches

    validates :tournament, presence: true
end