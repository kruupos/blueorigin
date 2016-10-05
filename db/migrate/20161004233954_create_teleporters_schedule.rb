class CreateTeleportersSchedule < ActiveRecord::Migration
  def change
    create_table :teleporters_schedules do |t|
      t.integer :departure_id, null: false
      t.integer :arrival_id, null: false
      t.date :date, null: false

      t.timestamps null: false
    end

    add_index :teleporters_schedules [:departure_id, :arrival_id]
    add_foreign_key :teleporters_schedules, :cities, column: :departure_id, on_update: :cascade, on_delete: :cascade
    add_foreign_key :teleporters_schedules, :cities, column: :arrival_id, on_update: :cascade, on_delete: :cascade
  end
end
