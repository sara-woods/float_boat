class BookingsController < ApplicationController


  def my_bookings
    @bookings = Booking.where(user: current_user)
  end
end
