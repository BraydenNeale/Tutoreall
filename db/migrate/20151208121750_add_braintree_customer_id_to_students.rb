class AddBraintreeCustomerIdToStudents < ActiveRecord::Migration
  def change
    add_column :students, :braintree_customer_id, :string
  end
end
