class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.string :name
      t.text :about
      t.decimal :fee
      t.string :logo
      t.string :banner
      t.string :email

      t.timestamps null: false
    end
  end
end
