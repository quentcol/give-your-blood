class CenterController < ApplicationController
  def index
    @centers = Center.all
  end
end
