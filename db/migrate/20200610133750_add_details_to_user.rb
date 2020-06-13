class AddDetailsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_admin,  :boolean, default: false
    add_column :users, :is_member, :boolean, default: false
  end
end
