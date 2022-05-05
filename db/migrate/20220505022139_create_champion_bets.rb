class CreateChampionBets < ActiveRecord::Migration[7.0]
  def change
    create_table :champion_bets do |t|
      # t.has_one :player
      # t.has_one :team
      # t.has_one :tournament
    end
  end
end
