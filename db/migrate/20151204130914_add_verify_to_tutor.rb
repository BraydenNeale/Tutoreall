class AddVerifyToTutor < ActiveRecord::Migration
  def change
    add_column :tutors, :verified, :boolean, :default => false
  end
end
