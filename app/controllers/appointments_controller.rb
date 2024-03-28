class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def index
    @appointments = Appointment.all
    @appointments = policy_scope(Appointment)
  end

  def show
    authorize @appointment
  end

  def new
    @donor = current_user.donor
    unless current_user.donor
      redirect_to new_donor_path, notice: 'Create a donor profile.'
    end
    @appointment = Appointment.new
    authorize @appointment
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.donor = current_user.donor
    @appointment.person_in_charge = 'Center Staff'
    @appointment.status ||= :pending
    authorize @appointment
    if @appointment.save
      redirect_to donor_path(@appointment.donor), notice: 'Appointment was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
    authorize @appointment
  end

  def update
    if @appointment.update(appointment_params)
      authorize @appointment
      redirect_to @appointment, notice: 'Appointment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    authorize @appointment
    if @appointment.status == "canceled"
      @appointment.destroy
      respond_to do |format|
        format.js
      end
    else
      redirect_to @appointment.donor, alert: 'You can only delete appointments with a status of "canceled".'
    end
  end


  def cancel
    @appointment = Appointment.find(params[:id])
    @appointment.update(status: 3)
    authorize @appointment
    if current_user.donor
      redirect_to donor_path(@appointment.donor), notice: 'Appointment has been canceled.'
    else
      redirect_to hospital_path(@appointment.center.hospital), notice: 'Appointment has been canceled.'
    end
  end

  def approve
    @appointment = Appointment.find(params[:id])
    @appointment.update(status: 1)
    authorize @appointment
    redirect_to hospital_path(@appointment.center.hospital), notice: 'Appointment was successfully approved.'
  end

  def deny
    @appointment = Appointment.find(params[:id])
    @appointment.update(status: 2)
    authorize @appointment
    redirect_to hospital_path(@appointment.center.hospital), notice: 'Appointment was denied.'
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:appointment_date, :appointment_time, :donor_id, :center_id)
  end
end
