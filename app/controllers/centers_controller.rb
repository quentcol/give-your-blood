class CentersController < ApplicationController
  before_action :set_center, only: [:show, :edit, :update, :destroy]

  def index
    @centers = Center.all
  end

  def show
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
    redirect_to centers_url, notice: 'Center was successfully destroyed.'
  end

  private

  def set_center
    @center = Center.find(params[:id])
  end

  def center_params
    params.require(:center).permit(:address, :name, :hospital_id)
  end
end

