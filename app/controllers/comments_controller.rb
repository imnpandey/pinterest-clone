class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = pin.comments.create(comment_params)
    if comment.save
      redirect_to :back
    end
  end

  private

  def pin
    Pin.find(params[:pin_id])
  end

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end
end
