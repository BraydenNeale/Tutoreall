class AddNameToTutor < ActiveRecord::Migration
  def change
    add_column :tutors, :firstname, :string
    add_column :tutors, :lastname, :string
  end
end
