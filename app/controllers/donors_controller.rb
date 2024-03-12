class DonorsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_donor_category
  before_action :set_donor, only: [:show, :edit, :update, :destroy]

  def index
    @donors = Donor.all
  end

  def show
  end

  def new
    @donor = Donor.new
  end

  def create
    @donor = Donor.new(donor_params)
    @donor.user = current_user
    if @donor.save
      redirect_to donors_path, notice: 'Donor was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def edit
  end

  def update
    if @donor.update(donor_params)
      redirect_to @donor, notice: 'Donor was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @donor.destroy
    redirect_to donors_url, notice: 'Donor was successfully destroyed.'
  end

  private

  def check_donor_category
    redirect_to root_path, alert: "You are not authorized to access this page" unless current_user.donor?
  end

  def set_donor
    @donor = Donor.find(params[:id])
  end

  def donor_params
    params.require(:donor).permit(:address, :blood_type, :birthdate, :first_name, :last_name, :national_id)
  end
end
