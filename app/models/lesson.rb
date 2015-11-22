class Lesson < ActiveRecord::Base
  belongs_to :tutor
  belongs_to :student

  def get_cost
    return helper.number_to_currency(self.duration * self.tutor.rate)
  end

  def helper
    ActionController::Base.helpers
  end
end
