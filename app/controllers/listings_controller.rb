class ListingsController < ApplicationController


  def index
    @listings = Listing.find(params[:id])
  end

  def show
  end

  def new
    @game = Game.find(params[:id])
    @listing = Listing.new
  end

  def create
    @game = Game.find(params[:id])
    puts listing_params
    # newListing = Listing.create(game_id: @game.id, user_id: current_user.id, title: )
  end

  def update
  end

  private
  
  def listing_params
    params.require(:listing).permit(:title, :description)
  end
end
