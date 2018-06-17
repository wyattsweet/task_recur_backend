class AddOccurrencesRemainingAndRecurringToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :occurrences_remaining, :boolean
    add_column :tasks, :recurring, :boolean
  end
end
