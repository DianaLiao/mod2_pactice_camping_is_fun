class SignupsController < ApplicationController

  def new
    if flash[:errors]
      @errors = flash[:errors]
    end
    @signup = Signup.new
  end

  def show

  end

  def create
    signup = Signup.create(signup_params)

    if signup.valid?
      redirect_to camper_path(signup.camper.id)
    else
      flash[:errors] = signup.errors.full_messages
      redirect_to new_signup_path
    end
  end

  def destroy
    set_signup
    camper_id = @signup.camper_id
    @signup.destroy

    redirect_to camper_path(camper_id)
  end

  private

  def set_signup
    @signup = Signup.find(params[:id])
  end

  def signup_params
    params.require(:signup).permit(:camper_id, :activity_id, :hour)
  end

end
