class CreatePlayer < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      has_many :championbets
      has_many :bets
    end
  end
end
