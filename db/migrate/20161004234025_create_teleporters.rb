class CreateTeleporters < ActiveRecord::Migration
  def change
    create_table :teleporters do |t|
      t.references :schedule, null: false, index: true
      t.references :user, null: false, index: true

      t.timestamps null: false
    end
  end
end
