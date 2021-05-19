class ListingsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit]

  def index
    
  end

  def show
    puts 'showing'
    @listing = Listing.find(params[:id])
    @game = Game.find(@listing[:game_id])
  end

  def edit
    puts 'editing'
    @listing = Listing.find(params[:id])
    @game = Game.find(@listing[:game_id])
  end

  def update
    puts 'im updating'
    @listing = Listing.find(params[:id])
    @game = Game.find(@listing[:game_id])
    puts @listing.title
    puts @game.id.to_s
    if @listing.update(listing_params)
      redirect_to show_listing_path(@listing.id)
    else
      render :edit
    end
  end

  def new
    @game = Game.find(params[:id])
    @listing = Listing.new
    puts "i created a new listing: " + @listing.nil?.to_s
  end

  def create
    puts 'creating'
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

  private
  
  def listing_params
    params.require(:listing).permit(:title, :description, :game_id)
  end
end
