class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name

      has_one :country
      has_many :championbet
      has_many :matches
      has_many :bets
      has_many :matches
    end
  end
end
