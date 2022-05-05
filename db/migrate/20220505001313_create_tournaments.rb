class CreateTournaments < ActiveRecord::Migration[7.0]
  def change
    create_table :tournaments do |t|
      t.string :name

      # t.has_one :sport
      # t.has_many :stages
      # t.has_many :champion_bets
    end
  end
end
