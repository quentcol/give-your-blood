class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def index
    @appointments = Appointment.all
  end

  def show
  end

  def new
    @appointment = Appointment.new
    authorize @appointment
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.status = 'pending'
    authorize @appointment
    if @appointment.save
      redirect_to root_path, notice: 'Appointment was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to @appointment, notice: 'Appointment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to @appointment, notice: 'Appointment was successfully destroyed.'
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:appointment_date, :appointment_time, :person_in_charge, :donor_id, :center_id, :status)
  end
end
