class CreateTournaments < ActiveRecord::Migration[7.0]
  def change
    create_table :tournaments do |t|
      t.string :name

      has_one :sport
      has_many :stages
      has_many :championbets
  end
end
