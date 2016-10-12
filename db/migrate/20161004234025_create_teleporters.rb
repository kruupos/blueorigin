class CreateTeleporters < ActiveRecord::Migration
  def change
    create_table :teleporters do |t|
      t.integer :schedule_id, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
