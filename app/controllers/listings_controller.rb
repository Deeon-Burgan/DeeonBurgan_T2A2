class ListingsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit]

  def index
    
  end

  def show
    @listing = Listing.find(params[:id])
    @game = Game.find(@listing[:game_id])
  end

  def edit
    
  end

  def new
    @game = Game.find(params[:id])
    @listing = Listing.new
    puts "i created a new listing: " + @listing.nil?.to_s
  end

  def create
    # @game = Game.find(params[:id])
    # newListing = Listing.create(game_id: @game.id, user_id: current_user.id, title: )
    @listing = current_user.listings.create({
      game_id: params[:game_id],
      title: params[:listing][:title],
      description: params[:listing][:description],
      images: params[:listing][:images]
    })
    if @listing.valid?
      redirect_to root_path(Game: Game.find(params[:game_id]).name)
    else
      puts @listing.errors.full_messages
      # render :new
    end
  end

  def update

  end

  private
  
  def listing_params
    params.require(:listing).permit(:title, :description, :game_id)
  end
end
