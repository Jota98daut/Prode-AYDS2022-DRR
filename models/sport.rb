# frozen_string_literal: true

class Sport < ActiveRecord::Base
  has_many :tournaments
end
