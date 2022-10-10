# frozen_string_literal: true

class Bet < ActiveRecord::Base
  belongs_to :team
  belongs_to :match
  belongs_to :player

  validates :match, presence: true
  validates :player, presence: true

  def calculate_points
    acum = 0
    acum += 1 if draw && match.draw
    acum += 1 if team && (team == match.winner)
    acum
  end

  def no_points_charged
    points.nil?
  end
end
