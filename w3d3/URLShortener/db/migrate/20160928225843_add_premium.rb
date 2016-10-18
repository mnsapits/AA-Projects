class AddPremium < ActiveRecord::Migration
  def up
    add_column :users, :premium, :boolean, default: false

    User.find_each do |user|
      user.premium = false
      user.save!
    end
  end
end
