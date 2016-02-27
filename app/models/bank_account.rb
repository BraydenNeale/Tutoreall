class BankAccount < ActiveRecord::Base
  belongs_to :provider, polymorphic: true
end
