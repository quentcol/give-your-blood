class HospitalsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_hospital_category
  before_action :set_hospital, only: [:show, :edit, :update, :destroy]

  def index
    @hospital = current_user.hospital
  end

  def show
    authorize @hospital
    @appointments = Appointment.where(center_id: @hospital.centers)
  end

  def new
    @hospital = Hospital.new
    authorize @hospital
  end

  def create
    @hospital = Hospital.new(hospital_params)
    authorize @hospital
    @hospital.user = current_user
    if @hospital.save
      redirect_to @hospital, notice: 'Hospital was successfully created.'
    else
      render :new
    end
  end

  def edit
    authorize @hospital
  end

  def update
    if @hospital.update(hospital_params)
      authorize @hospital
      redirect_to @hospital, notice: 'Hospital was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @hospital.destroy
    authorize @hospital
    @hospital.destroy
    redirect_to root_path, notice: 'Hospital was successfully destroyed.'
  end

  private

  def check_hospital_category
    redirect_to root_path, alert: "You are not authorized to access this page" unless current_user.hospital?
  end

  def set_hospital
    @hospital = Hospital.find(params[:id])
  end

  def hospital_params
    params.require(:hospital).permit(:hospital_name)
  end
end
