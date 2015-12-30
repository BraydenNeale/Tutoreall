class AddSuburbToTutor < ActiveRecord::Migration
  def change
    add_column :tutors, :suburb, :string
  end
end
