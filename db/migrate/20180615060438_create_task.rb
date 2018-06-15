class CreateTask < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :timeframe
      t.integer :occurrences
      t.integer :occurrences_remaining
      t.boolean :recurring
      t.boolean :complete
    end
  end
end
