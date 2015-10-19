class AddDetailsToTutor < ActiveRecord::Migration
  def change
    add_column :tutors, :image, :string
    add_column :tutors, :age, :Integer
    add_column :tutors, :rate, :decimal
    add_column :tutors, :about, :text
    add_column :tutors, :experience, :text
  end
end
