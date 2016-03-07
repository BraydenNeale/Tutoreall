class AddCostToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :cost, :decimal, precision: 6, scale: 2
  end
end
