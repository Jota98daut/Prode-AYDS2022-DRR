# frozen_string_literal: true

class CreateTournaments < ActiveRecord::Migration[7.0]
  def change
    create_table :tournaments do |t|
      t.string :name

      t.belongs_to :sport

      t.timestamps
    end
  end
end
