class AddWebsiteToOrganisation < ActiveRecord::Migration
  def change
    add_column :organisations, :website, :string
  end
end
