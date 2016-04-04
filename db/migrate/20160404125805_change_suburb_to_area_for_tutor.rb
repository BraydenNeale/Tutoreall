class ChangeSuburbToAreaForTutor < ActiveRecord::Migration
  remove_column :tutors, :suburb, :string
  add_column :tutors, :suburb, :integer
  drop_join_table :areas, :tutors
end
