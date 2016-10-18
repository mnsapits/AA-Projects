class UpdateUserTableSecond < ActiveRecord::Migration
  def change
    remove_column :users, :name, :email
    add_column :users, :username, :string
  end
end
