class AddHoverTextToOrganisation < ActiveRecord::Migration
  def change
    add_column :organisations, :hover_text, :text
  end
end
