class CreateTeleportersSchedule < ActiveRecord::Migration
  def change
    create_table :teleporters_schedules do |t|
      t.integer :departure_id, null: false
      t.integer :arrival_id, null: false
      t.date :date, null: false

      t.timestamps null: false
    end
  end
end
