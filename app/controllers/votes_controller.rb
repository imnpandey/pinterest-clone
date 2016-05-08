class VotesController < ApplicationController
  def create
    like = Vote.new
    like.user_id = current_user.id
    like.pin_id = params[:id]

    if like.save
      redirect_to :back
    else
      redirect_to :back, notice: "Enter Something"
    end
  end

  def destroy
    dislike = Vote.where(user_id: current_user.id).where(pin_id: params[:id])
    dislike.delete_all

    redirect_to :back
  end

  private

  def pin
    @_pin ||= Pin.find(params[:id])
  end
end
