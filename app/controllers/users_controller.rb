class UsersController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    if(current_user != @user)
      redirect_to root
    end
  end
end
