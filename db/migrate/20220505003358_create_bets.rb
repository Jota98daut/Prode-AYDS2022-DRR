class CreateBets < ActiveRecord::Migration[7.0]
  def change
    create_table :bets do |t|
      t.boolean : draw

      has_one :team
      has_one :match
      has_one :player
    end
  end
end
