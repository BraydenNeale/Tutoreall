class CreateBankAccounts < ActiveRecord::Migration
  def change
    create_table :bank_accounts do |t|
      t.string :number
      t.string :bsb
      t.string :name

      t.timestamps null: false
    end
  end
end
