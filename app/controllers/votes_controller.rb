class VotesController < ApplicationController
  def create
    like = current_user.votes.build(pin_id: params[:id])

    if like.save
      redirect_to :back
    else
      redirect_to :back, notice: "Enter Something"
    end
  end

  def destroy
    dislike = current_user.votes.where(pin_id: params[:id])
    dislike.delete_all

    redirect_to :back
  end
end
