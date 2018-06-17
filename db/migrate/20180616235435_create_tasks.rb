class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :timeframe
      t.integer :occurances
      t.boolean :complete
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
