class CampersController < ApplicationController
  def index
    @campers = Camper.all
  end

  def show
    set_camper
  end

  def new
    if flash[:errors]
      @errors = flash[:errors]
    end

    @camper = Camper.new
  end

  def create
    camper = Camper.create(camper_params)

    if camper.valid?
      redirect_to camper_path(camper.id)
    else
      flash[:errors] = camper.errors.full_messages
      redirect_to new_camper_path
    end

  end
 

  private

  def set_camper
    @camper = Camper.find(params[:id])
  end

  def camper_params
    params.require(:camper).permit(:name, :age)
  end
end
