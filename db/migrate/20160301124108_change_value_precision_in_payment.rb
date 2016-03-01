class ChangeValuePrecisionInPayment < ActiveRecord::Migration
  def change
    change_column :payments, :value, :decimal, precision: 6, scale: 2
  end
end
