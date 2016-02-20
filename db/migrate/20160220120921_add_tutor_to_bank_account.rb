class AddTutorToBankAccount < ActiveRecord::Migration
  def change
    add_reference :bank_accounts, :tutor, index: true, foreign_key: true
  end
end
