class Organisation < ActiveRecord::Base
  has_one :bank_account, dependent: :destroy, as: :provider
  accepts_nested_attributes_for :bank_account, allow_destroy: true
  has_many :associations

  has_many :tutors, -> { where(associations: {confirmed: true} )}, through: :associations, source: :tutor
  has_many :tutor_requests, -> { where(associations: {confirmed: true} )}, through: :associations, source: :tutor

  mount_uploader :logo, LogoUploader
  mount_uploader :banner, BannerUploader

  validates :name, presence: true, uniqueness: true, length: {in: 2..100}
  validates :fee, presence: true, numericality: true
  validates :website, length: { maximum: 100}
  validates :about, length: { maximum: 3000 }
  validates :email, presence: true, format:  {with: /@/}

  def get_fee
    return helper.number_to_currency(self.fee)
  end

  def no_bank_account
    attributes[:bank_account_id].blank?
  end

  def helper
    ActionController::Base.helpers
  end
end
