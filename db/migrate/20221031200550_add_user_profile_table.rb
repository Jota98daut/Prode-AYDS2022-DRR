class AddUserProfileTable < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profiles do |t|
      t.string :email
      t.string :avatar, default: '/images/avatar0.png'
      t.belongs_to :user
      t.timestamps
    end
  end
end
