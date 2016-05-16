class PinsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @pins = Pin.includes(:user).recent
            .paginate(page: params[:page], per_page: 10)
    if request.xhr?
      render partial: @pins
    end
  end

  def show
    @pin = Pin.includes(:user).where(id: id)
               .references(:users)
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
    pin = current_user.pins.find(id)
    pin.destroy

    redirect_to root_path
  end

  private

  def id
    params[:id]
  end

  def pin_params
    params.require(:pin).permit(:description, :image)
  end
end
