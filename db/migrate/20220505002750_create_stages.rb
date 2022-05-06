class CreateStages < ActiveRecord::Migration[7.0]
  def change
    create_table :stages do |t|
      t.string :name
      t.boolean :penalties

      t.belongs_to :tournament

      t.timestamps
    end
  end
end
