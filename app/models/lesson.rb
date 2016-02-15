class Lesson < ActiveRecord::Base
  belongs_to :tutor
  belongs_to :student

  validates :subject, presence: true
  validates :duration, presence:true
  validates :date, presence: true
  validates :location, presence: true
  validates :description, length: { maximum: 2000 }

  # attr_accessible :student_id, :tutor_id, :date, :subject, :description, :duration, :tutor_change, :location

  include Workflow
  workflow do 
    state :new do # Lesson was just created (tutor_change tracks who created it)
      event :approve, transitions_to:  :approved
      event :edit, transitions_to: :edited
    end
    state :approved do # Lesson accepted with current details
      event :edit, transitions_to: :edited
      event :cancel, transitions_to: :cancelled
      event :pay, transitions_to: :paid
    end
    state :paid do # Lesson paid for through braintree
      event :refund, transitions_to: :refunded
    end
    state :edited do # Lesson details updated (tutor_change tracks who changed it)
      event :approve, transitions_to: :approved
    end
    state :completed do # Lesson date has passed
    end
    state :cancelled # Lesson was cancelled
    state :problem # Lesson date has passed - someone has raised a problem with the lesson
    state :refunded # Lesson has been refunderd
  end

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
