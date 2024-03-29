# frozen_string_literal: true

class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name

      t.belongs_to :country

      t.timestamps
    end
  end
end
