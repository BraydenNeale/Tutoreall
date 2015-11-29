class AddDobToTutor < ActiveRecord::Migration
  def change
    add_column :tutors, :date_of_birth, :date
  end
end
