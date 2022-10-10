# frozen_string_literal: true

class Tournament < ActiveRecord::Base
  belongs_to :sport
  has_many :stages
  has_many :championbets
  has_many :scores
end
