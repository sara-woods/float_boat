class ReviewsController < ApplicationController
  before_action :set_boat, except: [:destroy]
  before_action :authenticate_user!

  def create
    @review = Review.new(review_params)
    @review.boat = @boat
    @review.user = current_user

    if @review.save
      redirect_to boat_path(@boat, anchor: "review-#{@review.id}")
    else
      render :new
    end
  end

  def destroy
  @review = Review.find(params[:id])
  @review.destroy

  redirect_to boat_path(@review.boat)
  end

  private

  def set_boat
    @boat = Boat.find(params[:boat_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end

end
