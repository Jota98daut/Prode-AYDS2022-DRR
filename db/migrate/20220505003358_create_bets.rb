# frozen_string_literal: true

class CreateBets < ActiveRecord::Migration[7.0]
  def change
    create_table :bets do |t|
      t.boolean :draw

      t.belongs_to :player
      t.belongs_to :team
      t.belongs_to :match

      t.timestamps
    end
  end
end
