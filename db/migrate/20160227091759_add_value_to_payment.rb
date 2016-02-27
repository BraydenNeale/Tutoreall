class AddValueToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :value, :decimal
  end
end
