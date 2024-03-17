class CentersController < ApplicationController
  before_action :set_center, only: [:show, :edit, :update, :destroy]

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
