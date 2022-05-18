class CreatePlayer < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.belongs_to :users

      t.timestamps
    end
  end
end
