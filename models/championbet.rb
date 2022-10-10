# frozen_string_literal: true

class ChampionBet < ActiveRecord::Base
  belongs_to :player
  belongs_to :team
  belongs_to :tournament

  validates :player, presence: true
  validates :team, presence: true
  validates :tournament, presence: true
end
