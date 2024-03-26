class AboutUsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    authorize :about_us, :index?
  end
end
