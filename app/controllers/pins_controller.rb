class PinsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @pins = Pin.paginate(page: params[:page], per_page: 10)
    if request.xhr?
      render partial: @pins
    end
  end

  def show
    @pin = Pin.find(params[:id])
  end

  def new
    @pin = current_user.pins.build
    authorize! :create, @pin
  end

  def create
    pin = current_user.pins.build(pin_params)
    authorize! :create, pin
    if pin.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    pin = current_user.pins.find(params[:id])
    pin.destroy

    redirect_to root_path
  end

  private

  def pin_params
    params.require(:pin).permit(:description, :image)
  end
end
