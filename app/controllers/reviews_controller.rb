class ReviewsController < ApplicationController
  before_action :set_center
  before_action :set_review, only: [:show, :edit, :update, :destroy]


  def index
    @reviews = @center.reviews
  end


  def new
    @review = @center.reviews.new
  end

  def create
    @review = @center.reviews.new(review_params)
    if @review.save
      redirect_to center_reviews_path(@center), notice: 'Review was successfully created.'
    else
      render :new
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
      params.require(:review).permit(:rating, :review_content).merge(patient_id: current_patient.id)
    end
end

