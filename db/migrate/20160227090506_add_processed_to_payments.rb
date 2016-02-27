class AddProcessedToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :processed, :boolean, null: false, default: false
  end
end