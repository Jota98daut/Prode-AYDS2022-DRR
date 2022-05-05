class CreatePlayer < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      # t.has_many :championbets
      # t.has_many :bets
    end
  end
end
