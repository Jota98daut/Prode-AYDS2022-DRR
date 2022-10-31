class AddAvatarAttributeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :avatar, :string, default: "/images/avatar0.png", null: false
  end
end
