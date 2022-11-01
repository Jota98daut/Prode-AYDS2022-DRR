# frozen_string_literal: true

class User < ActiveRecord::Base
  has_secure_password
  has_one :user_profile

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
end

class Player < User
  has_many :championbets
  has_many :bets
  has_many :scores

  def score_for(tournament_id)
    Score.find_by(player_id: id, tournament_id: tournament_id).points
  end

  def create_scores
    Tournament.all.each do |tournament|
      Score.create(player_id: id, points: 0, tournament: tournament)
    end
  end
end

class Admin < User
end

class UserProfile < ActiveRecord::Base
  belongs_to :user
end