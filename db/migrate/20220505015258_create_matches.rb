class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.date :date
      t.time :time
      t.boolean :draw

      has_many :bets
      has_one :team # participant 1
      has_one :team # participant 2
      has_one :team # winner
      belongs_to :stage
    end
  end
end
