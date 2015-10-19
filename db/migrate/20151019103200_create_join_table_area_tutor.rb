class CreateJoinTableAreaTutor < ActiveRecord::Migration
  def change
    create_join_table :areas, :tutors do |t|
      t.index [:area_id, :tutor_id]
      t.index [:tutor_id, :area_id]
    end
  end
end
