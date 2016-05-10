class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    like = current_user.votes.build(pin_id: params[:id])
    authorize! :create, like
    flash[:notice] = "Unable to like" unless like.save
    redirect_to :back
  end

  def destroy
    dislike = current_user.votes.where(pin_id: params[:id])
    dislike.delete_all

    redirect_to :back
  end
end
