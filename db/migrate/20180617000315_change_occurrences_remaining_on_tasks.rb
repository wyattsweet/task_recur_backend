class ChangeOccurrencesRemainingOnTasks < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :occurrences_remaining, 'integer USING CAST(occurrences_remaining AS integer)' 
  end
end
