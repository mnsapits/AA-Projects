class UpdateUserTable < ActiveRecord::Migration
  def change
    add_column :users, :fake, :string
  end
end
