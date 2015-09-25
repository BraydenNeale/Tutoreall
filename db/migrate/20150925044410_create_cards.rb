class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :Number
      t.string :Expiry
      t.string :Code

      t.timestamps null: false
    end
  end
end
