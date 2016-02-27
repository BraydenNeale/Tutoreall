class CreateJoinTableOrganistationTutor < ActiveRecord::Migration
  def change
    create_join_table :organisations, :tutors do |t|
      t.index [:organisation_id, :tutor_id]
      t.index [:tutor_id, :organisation_id]
    end
  end
end
