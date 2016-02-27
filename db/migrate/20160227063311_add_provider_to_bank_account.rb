class AddProviderToBankAccount < ActiveRecord::Migration
  def change
    add_reference :bank_accounts, :provider, polymorphic: true, index: true
  end
end
