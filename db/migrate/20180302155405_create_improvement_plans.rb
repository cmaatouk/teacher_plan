class CreateImprovementPlans < ActiveRecord::Migration
  def change
    create_table :improvement_plans do |t|
      t.integer :teacher_id
      t.string :leader
      t.string :action_state

      t.timestamps

    end
  end
end
