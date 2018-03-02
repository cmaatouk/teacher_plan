class CreateCoachingPositions < ActiveRecord::Migration
  def change
    create_table :coaching_positions do |t|
      t.integer :user_id
      t.integer :improvement_plan_id

      t.timestamps

    end
  end
end
