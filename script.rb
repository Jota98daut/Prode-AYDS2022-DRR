# frozen_string_literal: true

teamA = Team.where(id: 1).first
teamB = Team.where(id: 2).first

match = Match.where(id: 1).first

bet = Bet.where(id: 1).first

score = Score.where(id: 1).first

score
