class AddForeignKeysToTeleporters < ActiveRecord::Migration
  def change
    add_foreign_key :teleporters, :schedules, column: :schedule_id, on_update: :cascade, on_delete: :cascade
    add_foreign_key :teleporters, :users, column: :user_id, on_update: :cascade, on_delete: :cascade
    add_foreign_key :schedules, :cities, column: :departure_id, on_update: :cascade, on_delete: :cascade
    add_foreign_key :schedules, :cities, column: :arrival_id, on_update: :cascade, on_delete: :cascade
  end
end
