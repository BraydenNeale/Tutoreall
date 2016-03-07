class BankAccount < ActiveRecord::Base
  belongs_to :provider, polymorphic: true

  validates :bsb, presence: true
  validates :number, presence: true
  validates :name, presence: true
end
