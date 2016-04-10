class SetSuburbDefault < ActiveRecord::Migration
  def change
    change_column_default :tutors, :suburb, 1
  end
end
