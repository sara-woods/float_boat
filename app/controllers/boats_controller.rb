class BoatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

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
    if params[:address].present?
      @boats = Boat.where("address ILIKE ?", "%#{params[:address]}%")
    else
      @boats = Boat.all
    end

       @markers = @boats.geocoded.map do |boat|
      {
        lat: boat.latitude,
        lng: boat.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { boat: boat })
      }
    end
  end

  def show
    @boat = Boat.find(params[:id])
    @booking = Booking.new
    if @boat.latitude && @boat.longitude
        @markers =  [{
        lat: @boat.latitude,
        lng: @boat.longitude
      }]
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
