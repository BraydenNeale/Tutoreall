class AddAvailabilityToTutor < ActiveRecord::Migration
  def change
    add_column :tutors, :availability, :string, default: []
  end
end
