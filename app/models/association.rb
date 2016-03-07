class Association < ActiveRecord::Base
  belongs_to :tutor
  belongs_to :organisation
end
