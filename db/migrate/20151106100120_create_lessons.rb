class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.references :tutor, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true
      t.datetime :date
      t.string :status

      t.timestamps null: false
    end
  end
end
