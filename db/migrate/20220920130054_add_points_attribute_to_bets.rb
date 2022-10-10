# frozen_string_literal: true

class AddPointsAttributeToBets < ActiveRecord::Migration[7.0]
  def change
    add_column :bets, :points, :int, default: nil, null: true
  end
end
