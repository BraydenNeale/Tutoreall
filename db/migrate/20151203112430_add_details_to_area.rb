class AddDetailsToArea < ActiveRecord::Migration
  def change
    add_column :areas, :state, :string
    add_column :areas, :city, :string
    add_column :areas, :region, :string
  end
end
