  # frozen_string_literal: true

class Match < ActiveRecord::Base
  has_many :bets
  belongs_to :home, class_name: 'Team'
  belongs_to :away, class_name: 'Team'
  belongs_to :winner, class_name: 'Team'
  belongs_to :stage

  validates :home, presence: true
  validates :away, presence: true
  validates :stage, presence: true
  validates :home, comparison: { other_than: :away }

  after_update :calculate_points, if: :result_charged?

  def result_charged?
    draw.present? || winner.present?
  end

  def calculate_points
    t = stage.tournament
    bets.each do |bet|
      player_score = (bet.player.scores.select { |score| score.tournament == t }).first
      new_points = bet.calculate_points
      bet.update(points: new_points)
      player_score.update(points: player_score.points + new_points)
    end
  end

  def set_params(params)
    stage = Stage.find_by(name: params[:stage_name]) or stage
    date = params[:date] or date
    time = params[:time] or time
    home = Team.find_by(name: params[:home_name]) or home
    away = Team.find_by(name: params[:away_name]) or away
  end
end
