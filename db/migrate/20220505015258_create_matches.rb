class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.date :date
      t.time :time
      t.boolean :draw

      # t.has_many :bets
      # t.has_one :team # participant 1
      # t.has_one :team # participant 2
      # t.has_one :team # winner
      t.belongs_to :stage
    end
  end
end
