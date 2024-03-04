class HospitalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_hospital, only: [:show, :edit, :update, :destroy]

  def index
    @hospitals = current_user.hospitals
  end

  def show
  end

  def new
    @hospital = Hospital.new
  end

  def create
    @hospital = current_user.hospitals.build(hospital_params)
    if @hospital.save
      redirect_to @hospital, notice: 'Hospital was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @hospital.update(hospital_params)
      redirect_to @hospital, notice: 'Hospital was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @hospital.destroy
    redirect_to hospitals_url, notice: 'Hospital was successfully destroyed.'
  end

  private

  def set_hospital
    @hospital = current_user.hospitals.find(params[:id])
  end

  def hospital_params
    params.require(:hospital).permit(:hospital_name)
  end
end