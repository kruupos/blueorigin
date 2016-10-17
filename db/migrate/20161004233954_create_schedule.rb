class CreateSchedule < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :departure, null: false, index: true
      t.references :arrival, null: false, index: true
      t.date :date, null: false

      t.timestamps null: false
    end
  end
end
