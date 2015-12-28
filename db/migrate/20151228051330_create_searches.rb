class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :area
      t.string :subjects, default: []
      t.string :availability, default: []
      t.integer :age

      t.timestamps null: false
    end
  end
end
