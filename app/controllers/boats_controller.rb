class BoatsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def my_boats
    @boats = current_user.boats
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user
    if @boat.save
      redirect_to my_boats_path
    else
      render :new
    end
  end

  def index
    @boats = Boat.all
  end

  def show
    @boat = Boat.find(params[:id])
    @booking = Booking.new
    @review = Review.new
    # check if boats have bookings => loop over bookings and see if they match the current_user
    # if they do match the current user => check if Date.today is passed ending_date of the booking
    @review_enabler = false
    if @boat.bookings.any? && user_signed_in?
         @boat.bookings.each do |booking|
            if booking.user == current_user && booking.ending_date < Date.today
            @review_enabler = true
            end
         end
    end
  end

  def edit
    @boat = Boat.find(params[:id])
  end

  def update
    @boat = Boat.find(params[:id])
    @boat.update(boat_params)
    if @boat.save
      redirect_to boat_path(@boat)
    else
      render :edit, alert: "Boat was edited successfully!"
    end
  end

  def destroy
    @boat = Boat.find(params[:id])
    @boat.destroy
    redirect_to my_boats_path, alert: "Boat was deleted successfully!"
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :address, :description, :daily_rate, photos: [])
  end
end
