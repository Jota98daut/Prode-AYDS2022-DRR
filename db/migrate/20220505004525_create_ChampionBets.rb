class CreateChampionbets < ActiveRecord::Migration[7.0]
  def change
    create_table : championbets do |t|
      has_one :player
      has_one :team
      has_one :tournament
    end
  end
end
