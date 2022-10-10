# frozen_string_literal: true

class AddUsersReferenceToPlayers < ActiveRecord::Migration[7.0]
  def change
    change_table :players do |t|
      t.belongs_to :user
    end
  end
end
