class AddDetailsToSubject < ActiveRecord::Migration
  def change
  	remove_column :subjects, :code
  	add_column :subjects, :faculty, :string
  	add_column :subjects, :group, :string
  end
end
