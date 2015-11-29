class RemoveAgeFromTutor < ActiveRecord::Migration
  def change
    remove_column :tutors, :age, :integer
  end
end
