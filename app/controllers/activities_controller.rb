class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def show
    set_activity
  end

  private
  
  def set_activity
    @activity = Activity.find(params[:id])
  end
end
