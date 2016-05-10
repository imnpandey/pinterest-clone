class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.follow user
    redirect_to :back
  end

  def destroy
    current_user.unfollow user
    redirect_to :back
  end

  private

  def user
    @_user ||= User.find(params[:id])
  end
end
