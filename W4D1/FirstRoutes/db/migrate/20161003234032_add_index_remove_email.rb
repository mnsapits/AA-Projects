class AddIndexRemoveEmail < ActiveRecord::Migration
  def change
    remove_column :users, :email
  end

  add_index :users, :username, unique: true
end
