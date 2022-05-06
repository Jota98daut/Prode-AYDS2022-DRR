class CreateChampionBets < ActiveRecord::Migration[7.0]
  def change
    create_table :champion_bets do |t|
      t.belongs_to :player
      t.belongs_to :team
      t.belongs_to :tournament

      t.timestamps
    end
  end
end
