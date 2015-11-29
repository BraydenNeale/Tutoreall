class AddLocationToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :location, :string
  end
end
