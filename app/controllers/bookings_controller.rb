class BookingsController < ApplicationController
  before_action :authenticate_user!

  def my_bookings
    @bookings = current_user.bookings
    @boat_bookings = current_user.boat_bookings
  end

  def my_boats
    @boats = current_user.boats
  end

  def create
  @boat = Boat.find(params[:boat_id])
  @booking = Booking.new(booking_params)
  @booking.boat = @boat
  @booking.user = current_user
  if @booking.save
    flash[:notice] = "Booking for #{@boat.name} complete!"
    redirect_to my_bookings_path
  else
    render "boats/show"
  end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.confirmation = params[:confirmation]
    if @booking.save
      redirect_to my_bookings_path, notice: "Booking #{@booking.confirmation ? 'confirmed' : 'declined' }!"
    else
      redirect_to my_bookings_path, alert: "Oops, something went wrong!"
    end
  end


  private

  def booking_params
    params.require(:booking).permit(:starting_date, :ending_date)
  end

end

