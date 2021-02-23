class BoatsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user
    if @boat.save
      redirect_to boats_path
    else
      render :new
    end
  end

  def index
    @boats = Boat.all
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
      render :edit
    end
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :address, :description, :daily_rate)
  end

end
