class UsersController < ApplicationController
  before_action :user_id, only: [:show]
  before_action :set_user, only: [:show, :edit, :update, :destroy, :finish_signup]

  def index
    @users = User.all
  end

  def show
    @pins = Pin.where(user_id: user_id)
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        sign_in(@user == current_user ? @user : current_user, :bypass => true)
        redirect_to @user, notice: "Your profile was successfully updated."
      else
        render 'edit'
      end
    end
  end

  def finish_signup
    if !current_user || !current_user.email.include?('twitter')
      redirect_to root_path
    else
      if (request.patch? && params[:user]) && @user.update(user_params)
        @user.skip_reconfirmation!
        sign_in(@user, :bypass => true)
        redirect_to @user, notice: 'Confirm your email.'
      else
        @show_errors = true
      end
    end
  end

  def destroy
    @user.destroy
    redirect_to root_url
  end

  private

  def user_id
    params[:id]
  end

  def set_user
    @user = User.find(user_id)
  end

  def user_params
    accessible = [ :name, :email ] # extend with your own params
    accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
    params.require(:user).permit(accessible)
  end
end
