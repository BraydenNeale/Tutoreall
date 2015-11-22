class AddDetailsToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :subject, :string
    add_column :lessons, :description, :text
  end
end
