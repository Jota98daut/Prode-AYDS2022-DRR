# frozen_string_literal: true

class CreateScores < ActiveRecord::Migration[7.0]
  def change
    create_table :scores do |t|
      t.integer :points

      t.belongs_to :player
      t.belongs_to :tournament

      t.timestamps
    end
  end
end
