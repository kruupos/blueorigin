class CreateTeleporters < ActiveRecord::Migration
  def change
    create_table :teleporters do |t|
      t.integer :schedule_id, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end

    add_foreign_key :teleporters, :teleporters_schedules, column: :schedule_id, on_update: :cascade, on_delete: :cascade
    add_foreign_key :teleporters, :users, column: :user_id, on_update: :cascade, on_delete: :cascade
  end
end
