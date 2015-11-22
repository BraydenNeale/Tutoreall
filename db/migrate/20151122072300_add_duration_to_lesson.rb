class AddDurationToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :duration, :integer
    add_column :lessons, :tutor_change, :boolean
  end
end
