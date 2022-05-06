class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.date :date
      t.time :time
      t.boolean :draw

      t.references :home, index: true, foreign_key: { to_table: :team }
      t.references :away, index: true, foreign_key: { to_table: :team }
      t.references :winner, index: true, foreign_key: { to_table: :team }
      t.belongs_to :stage

      t.timestamps
    end
  end
end
