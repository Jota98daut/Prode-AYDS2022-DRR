# frozen_string_literal: true

class Country < ActiveRecord::Base
  has_many :teams
end
