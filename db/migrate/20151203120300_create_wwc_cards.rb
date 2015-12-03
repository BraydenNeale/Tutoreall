class CreateWwcCards < ActiveRecord::Migration
  def change
    create_table :wwc_cards do |t|
      t.references :tutor
      t.string :number
      t.date :expiry

      t.timestamps null: false
    end
  end
end