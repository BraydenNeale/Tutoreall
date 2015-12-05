class WwcCard < ActiveRecord::Base
	# allow blank so you can keep profile updated without a card - but won't be index if blank
	validates :number, uniqueness: true, presence: true, :allow_blank => true
	validates :expiry, presence: true, :allow_blank => true

	# validate :verify_card

	belongs_to :tutor

	# May do this client side - or check in controller
	# want to allow a blank card to be saved - but not verify the tutor in that case

	# def verify_card
	# 	# WWC num is 6 chars long
	# 	if self.number.length != 6
	# 		errors.add :base, 'Number not correct format'
	# 		return
	# 	end

	# 	# WWC num is all digits
	# 	if !/\A\d+\z/.match(self.number) # if not a positive number
	# 		errors.add :base, 'Number not correct format'
	# 		return
	# 	end

	# 	# if card has expired
	# 	if(self.expiry <= Date.today)
	# 		errors.add :base, "Card has expired"
	# 		return
	# 	end

	# 	# complex selenium script or compare with webscraped data 
	# 	# to determine if is valid according to www.checkwwc.wa.gov.au/
	# end
end
