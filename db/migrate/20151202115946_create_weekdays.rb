class CreateWeekdays < ActiveRecord::Migration
  def change
    create_table :weekdays do |t|
      t.integer :day

      t.timestamps null: false
    end
  end
end
