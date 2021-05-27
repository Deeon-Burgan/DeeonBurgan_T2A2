class UsersController < ApplicationController
  
  before_action :check_id

  def show
    @user = User.find(params[:user_id])
    if(current_user != @user)
      redirect_to root_path
    end

    # if we get here and am an admin
    if(@user.admin == true)
      # redirect to the show admin page
      redirect_to show_admin_path(@user.id)
    end
  end

  def show_admin
    @user = User.find(params[:user_id])

    # Should only be able to enter an admin page
    # If we are the admin in question
    if(current_user != @user)
      # redirect to root if otherwise
      redirect_to root_path
    end

    @game = Game.new
  end

  def create_game
    Game.create(game_params)
    redirect_to root_path
  end

  def check_id
    if params[:user_id].to_i > User.all.length - 1
      redirect_to root_path
    end
  end

  private 

  def game_params
    params.require(:game).permit(:name, :description)
  end
end
