class Organisation < ActiveRecord::Base
  has_one :bank_account, dependent: :destroy, as: :provider
  has_and_belongs_to_many :tutors
end
