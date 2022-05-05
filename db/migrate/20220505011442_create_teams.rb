class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name

      # t.has_one :country
      # t.has_many :championbet
      # t.has_many :matches
      # t.has_many :bets
      # t.has_many :matches
    end
  end
end
