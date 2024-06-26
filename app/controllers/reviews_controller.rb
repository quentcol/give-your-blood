class ReviewsController < ApplicationController
  before_action :set_center
  before_action :set_review, only: [:show, :edit]

  def index
    @reviews = policy_scope(@center.reviews)
  end

  def show
  end

  def new
    @review = @center.reviews.new
    authorize @review
  end

  def create
    @review = @center.reviews.new(review_params)
    @review.donor = current_user.donor
    authorize @review
    if @review.save!
      redirect_to center_path(@center), notice: 'Review was successfully created.'
    else
      render :show
    end
  end

  private

  def set_center
    @center = Center.find(params[:center_id])
  end

  def set_review
    @review = @center.reviews.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :review_content).merge(donor_id: current_user.id)
  end
end
