class AddPointsAttributeToBets < ActiveRecord::Migration[7.0]
  def change
    add_column :bets, :points, :int, default: 0, null: true
  end
end
