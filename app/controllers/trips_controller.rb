class TripsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  respond_to :html
  def index
  	@trips = Trip.all
  	respond_with @trips
  end

  def show
  	@trip = Trip.find(params[:id])
  	respond_with @trip
  end

  def new
  	@trip = Trip.new
  end

  def create
  	@trip = current_user.trips.build(params[:trip])
  	flash[:notice] = "Trip created" if @trip.save
  	respond_with @trip
  end

  def edit
  	@trip = current_user.trips.find(params[:id])
  	respond_with @trip
  end

  def update
  	@trip = current_user.trips.find(params[:id])
  	flash[:notice] = 'Trip Updated' if @trip.update_attributes(params[:trip])
  	respond_with @trip
  end

  def destroy
  	@trip = current_user.trips.find(params[:id])
  	flash[:notice] = 'Trip Destryed' if @trip.destroy
  	redirect_to root_path
  end 
end
