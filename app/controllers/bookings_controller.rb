class BookingsController < ApplicationController
  def my_bookings
    @bookings = Booking.where(user: current_user)
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

  private

  def booking_params
    params.require(:booking).permit(:starting_date, :ending_date)
  end

end

