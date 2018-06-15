class AddTierToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :tier, :integer, default: 0
  end
end
