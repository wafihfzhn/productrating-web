class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    # TODO: Create the record in database
    @review = Review.new(review_params)

    if @review.save
      redirect_to request.referrer
    else
      redirect_to request.referrer
    end
  end

  private
    def review_params
      params.require(:review).permit(:rating, :comment, :purchase_id, :product_id, :store_id)
    end
end
