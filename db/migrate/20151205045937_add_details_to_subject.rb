class AddDetailsToSubject < ActiveRecord::Migration
  def change
  	remove_column :subject, :code
  	add_column :subject, :faculty, :string
  	add_column :subject, :group, :string
  end
end
