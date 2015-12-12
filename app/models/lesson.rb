class Lesson < ActiveRecord::Base
  belongs_to :tutor
  belongs_to :student

  def get_cost
    return helper.number_to_currency((self.duration * self.tutor.rate) / 60)
  end

  def braintree_payment
    return (self.duration * self.tutor.rate) / 60
  end

  def helper
    ActionController::Base.helpers
  end

  # Simple calender
  def start_time
  	self.date
  end
end
