class ChangeDefaultValueForRecurring < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :recurring, :boolean, default: false
  end
end
