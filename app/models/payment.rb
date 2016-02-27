class Payment < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :bank_account

  def get_value
    helper.number_to_currency(value, unit: "")
  end

  def helper
    ActionController::Base.helpers
  end
end
