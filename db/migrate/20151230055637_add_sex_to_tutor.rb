class AddSexToTutor < ActiveRecord::Migration
  def change
    add_column :tutors, :sex, :integer
  end
end
