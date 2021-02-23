class BoatsController < ApplicationController
 def index
    @boats = Boat.all
  end

  def show
    @boat = Boat.find(params[:id])
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
  params.require(:boat).permit(:name, :decription, :daily_rate)
end





end
