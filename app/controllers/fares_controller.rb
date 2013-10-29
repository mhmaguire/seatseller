class FaresController < ApplicationController
	before_filter :authenticate_user!
	respond_to :html

	#POST /trips/:trip_id/fares
	def create
		@trip = Trip.find(params[:trip_id])
		authorize! :request, @trip
		flash[:notice] = 'Seat Request Created' if @trip.add_fare(current_user.fares.create)
		respond_with @trip
	end

	#PUT /fares/:id
	#this action approves the fare
	def update
		@fare = Fare.find(params[:id])
		authorize! :manage, @fare.trip
		flash[:notice]='Fare approved' if @fare.approve!
		redirect_to :back 
	end
end
