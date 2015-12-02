class CreateJoinTableTutorWeekDay < ActiveRecord::Migration
  def change
    create_join_table :tutors, :weekdays do |t|
      t.index [:tutor_id, :weekday_id]
      t.index [:weekday_id, :tutor_id]
    end
  end
end
