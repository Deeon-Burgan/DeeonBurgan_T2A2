class UsersController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    if(current_user != @user)
      redirect_to root_path
    end

    if(@user.admin == true)
      redirect_to show_admin_path(@user.id)
    end
  end

  def show_admin
    @user = User.find(params[:user_id])
    if(current_user != @user)
      redirect_to root_path
    end
  end
end
