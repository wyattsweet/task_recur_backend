class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    change_table :tasks do |t|
      t.rename :occurances, :occurrences
    end
  end
end
