class ChangeIdInAssociation < ActiveRecord::Migration
  def change
    change_column :associations, :tutor_id, :integer, references: :tutors
    change_column :associations, :organisation_id, :integer, references: :organisations
  end
end
