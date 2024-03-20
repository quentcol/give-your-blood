class CentersController < ApplicationController
  before_action :set_center, only: [:show, :edit, :update, :destroy]

  def index
    @centers = Center.all
    @markers = @centers.geocoded.map do |center|
      {
        lat: center.latitude,
        lng: center.longitude
      }
    end
  end

  def show

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
  end

  def create
    @center = Center.new(center_params)
    if @center.save
      redirect_to @center, notice: 'Center was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @center.update(center_params)
      redirect_to @center, notice: 'Center was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
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
