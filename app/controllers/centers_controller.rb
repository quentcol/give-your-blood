class CentersController < ApplicationController
  before_action :set_center, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @centers = policy_scope(Center) # Fetch only authorized centers
    @markers = @centers.geocoded.map do |center|
      {
        lat: center.latitude,
        lng: center.longitude
      }
    end
  end

  def show
    authorize(@center)

    @days = Day.all
    @center = Center.find(params[:id])
    @reviews = @center.reviews
    @review = Review.new

    @opening_time = Schedule.where(center_id: @center.id)
    @reviews = Review.where(center_id: @center.id)
    @center_array = Center.where(id: @center.id)
    @markers = @center_array.geocoded.map do |center|
      {
        lat: center.latitude,
        lng: center.longitude
      }
    end

  end

  def new
    @center = Center.new
    authorize @center
  end

  def create
    @center = Center.new(center_params)

    authorize @center

    if @center.save
      redirect_to @center, notice: 'Center was successfully created.'
    else
      render :new
    end
  end

  def edit
    authorize @center
  end

  def update
    authorize @center
    if @center.update(center_params)
      redirect_to @center, notice: 'Center was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @center
    @center.destroy
    redirect_to @center, notice: 'Center was successfully destroyed.'
  end

  private

  def set_center
    @center = Center.find(params[:id])
  end

  def center_params
    params.require(:center).permit(:address, :name, :hospital_id)
  end
end
