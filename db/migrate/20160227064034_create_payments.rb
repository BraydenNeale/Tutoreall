class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :lesson, index: true, foreign_key: true
      t.references :bank_account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
