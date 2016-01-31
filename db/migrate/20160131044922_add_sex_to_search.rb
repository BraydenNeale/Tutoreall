class AddSexToSearch < ActiveRecord::Migration
  def change
    add_column :searches, :sex, :integer
  end
end
