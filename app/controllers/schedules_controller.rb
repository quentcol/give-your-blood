class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]


  def index
    @schedules = Schedule.all
  end

  def show
  end


  def new
    @schedule = Schedule.new
    @centers = Center.all
  end


  def edit
  end


  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to schedule_path(@schedule), notice: 'Schedule was successfully created.'
    else
      render :new
    end
  end


  def update
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
