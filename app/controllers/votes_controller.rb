class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    like = current_user.votes.build(pin_id: params[:id])
    authorize! :create, like

    if like.save
      redirect_to :back
    else
      redirect_to :back, notice: "Unable to like"
    end
  end

  def destroy
    dislike = current_user.votes.where(pin_id: params[:id])
    authorize! :create, dislike
    dislike.delete_all

    redirect_to :back
  end
end
