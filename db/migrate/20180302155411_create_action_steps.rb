class CreateActionSteps < ActiveRecord::Migration
  def change
    create_table :action_steps do |t|
      t.text :descriptions
      t.date :target_dates
      t.string :leader
      t.string :necessary_resources
      t.text :implementation_specifics
      t.integer :measure_of_success
      t.integer :goal_id

      t.timestamps

    end
  end
end
