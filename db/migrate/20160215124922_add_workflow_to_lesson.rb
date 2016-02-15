class AddWorkflowToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :workflow_state, :string
  end
end
