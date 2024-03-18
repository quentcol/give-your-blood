class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]


  def index
    @schedules = policy_scope(Schedule)
  end

  def show
    authorize @schedule
  end


  def new
    @schedule = Schedule.new
    @centers = Center.all
    authorize @schedule
  end


  def edit
    authorize @schedule
  end


  def create
    @schedule = Schedule.new(schedule_params)

    authorize @schedule

    if @schedule.save
      redirect_to schedule_path(@schedule), notice: 'Schedule was successfully created.'
    else
      render :new
    end
  end


  def update
    authorize @schedule

    if @schedule.update(schedule_params)
      redirect_to @schedule, notice: 'Schedule was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @schedule.destroy
    redirect_to schedules_url, notice: 'Schedule was successfully destroyed.'
  end

  private

    def set_schedule
      @schedule = Schedule.find(params[:id])
    end


    def schedule_params
      params.require(:schedule).permit(:day_id, :opening_time, :closing_time, :center_id)
    end
end
