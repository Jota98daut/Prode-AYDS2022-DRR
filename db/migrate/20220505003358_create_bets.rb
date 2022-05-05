class CreateBets < ActiveRecord::Migration[7.0]
  def change
    create_table :bets do |t|
      t.boolean :draw

      # t.has_one :team
      # t.has_one :match
      # t.has_one :player
    end
  end
end
