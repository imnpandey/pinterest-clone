class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = pin.comments.create(comment_params)
    authorize! :create, comment
    flash[:notice] = "Unable to comment" unless comment.save
    redirect_to :back
  end

  def destroy
    comment = current_user.comments.where(pin_id: params[:pin_id]).where(id: params[:id])
    comment.delete_all

    redirect_to :back
  end

  private

  def pin
    Pin.find(params[:pin_id])
  end

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end
end
