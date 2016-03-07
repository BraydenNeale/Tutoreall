class CreateAssociations < ActiveRecord::Migration
  def change
    create_table :associations do |t|
      t.integer :tutor_id
      t.integer :organisation_id
      t.boolean :confirmed, default: false

      t.timestamps null: false
    end

    drop_table :organisations_tutors
  end
end
