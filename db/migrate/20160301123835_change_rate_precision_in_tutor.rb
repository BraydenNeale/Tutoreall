class ChangeRatePrecisionInTutor < ActiveRecord::Migration
  def change
    change_column :tutors, :rate, :decimal, precision: 6, scale: 2
  end
end
