class Trip < ActiveRecord::Base
  attr_accessible :destination, :title, :start, :available_seats, :departure_time
  
  scope :available, where('available_seats > 0')

  #trip has an owner
  belongs_to :owner, class_name: 'User', foreign_key: :user_id
  #trip has many fares
  has_many :fares, dependent: :destroy
  #trip has many passengers, through fares, when the fares are approved
  has_many :passengers, 
  	through: :fares,
  	class_name: "User",
  	conditions: {'fares.approved' => true}
	has_many :requests, 
		through: :fares, 
		class_name: "User",
		source: :passenger, 
		conditions: {"fares.approved" => false}

		delegate :email, to: :owner

	def add_fare(fare) #requester is the requesting user
		self.fares << fare
	end

	def approve_fare(fare)
		return false unless available_seats > 0 
		fare.save
		self.available_seats -= 1
		save
	end

	def passenger_ids
		#return an array of ids for passengers
		fares.map { |f| f.passenger_id  }
	end

	def approved?
		approved
	end
end
