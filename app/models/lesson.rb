class Lesson < ActiveRecord::Base
  belongs_to :tutor
  belongs_to :student

  validates :subject, presence: true
  validates :duration, presence:true
  validates :date, presence: true
  validates :location, presence: true

  # attr_accessible :student_id, :tutor_id, :date, :status, :subject, :description, :duration, :tutor_change, :location

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
