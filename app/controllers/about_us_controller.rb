class AboutUsController < ApplicationController
  def index
    authorize :about_us, :index?
  end

  private

  def pundit_user
    # Make sure to define a pundit_user method if it's not already defined
    current_user
  end
end
