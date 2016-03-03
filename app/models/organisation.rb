class Organisation < ActiveRecord::Base
  has_one :bank_account, dependent: :destroy, as: :provider
  accepts_nested_attributes_for :bank_account, allow_destroy: true
  has_and_belongs_to_many :tutors

  mount_uploader :logo, PictureUploader
  mount_uploader :banner, BannerUploader
end
