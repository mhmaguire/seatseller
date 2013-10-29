class Fare < ActiveRecord::Base
	#fare tracks the association between trip and passenger
	belongs_to :trip
  belongs_to :passenger, class_name: "User", foreign_key: :passenger_id

  delegate :email, to: :passenger

  def approve!
  	self.approved = true
  	trip.approve_fare(self)
  end
end
