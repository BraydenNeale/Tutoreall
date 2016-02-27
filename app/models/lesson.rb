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
    state :initial do # Lesson was just created (tutor_change tracks who created it)
      event :approve, transitions_to:  :approved
      event :edit, transitions_to: :edited
      event :cancel, transitions_to: :cancelled
    end
    state :approved do # Lesson accepted with current details
      event :edit, transitions_to: :edited
      event :cancel, transitions_to: :cancelled
      event :pay, transitions_to: :paid
      event :finish, transitions_to: :completed
    end
    state :paid do # Lesson paid for through braintree
      event :refund, transitions_to: :refunded
      event :cancel, transitions_to: :cancelled
      event :finish, transitions_to: :completed
    end
    state :edited do # Lesson details updated (tutor_change tracks who changed it)
      event :approve, transitions_to: :approved
      event :cancel, transitions_to: :cancelled
    end
    state :completed do # Lesson date has passed
      event :problem_reported, transitions_to: :problem
    end
    state :problem do # Lesson date has passed - someone has raised a problem with the lesson
      event :resolve, transitions_to: :completed
      event :refund, transitions_to: :refunded
    end
    state :cancelled # Lesson was cancelled
    state :refunded # Lesson has been refunded

    # cancel paid? - cancelled and paid late fee
    # cancel refunded? - held funds returned to student
    # may need another state between after/before completed for when we/tutor gets the money
  end

  # Helpers
  def get_cost
    return helper.number_to_currency((self.duration * self.tutor.rate) / 60)
  end

  def braintree_payment
    return helper.number_to_currency((self.duration * self.tutor.rate) / 60, unit: "")
  end

  def helper
    ActionController::Base.helpers
  end

  # Simple calender
  def start_time
  	self.date
  end

  # Workflow state transitions
  def pay
    lesson = self # referring to self in a loop was a mindfuck
    cut = 5 # Our cut is $5
    to_pay_tutor = lesson.get_cost.to_f - cut

    self.tutor.organisations.each do |org|
      Payment.create(lesson_id: lesson.id, bank_account_id: org.bank_account.id)
      to_pay_tutor -= org.fee
    end

    Payment.create(lesson_id: lesson.id, bank_account_id: lesson.tutor.bank_account.id)

    # Determine %'s to pay to tutor and organisations
  end

  def approve
    # Send an email to other user
  end

  def cancel 
    # Send an email
  end

  # ... 
end
