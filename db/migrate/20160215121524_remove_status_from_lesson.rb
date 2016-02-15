class RemoveStatusFromLesson < ActiveRecord::Migration
  def change
    remove_column :lessons, :status, :string
  end
end
