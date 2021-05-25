class ListingsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit]
  before_action :initialize_game, only: [:show, :edit, :update]

  def index
    
  end

  def show
    puts 'showing'
    @listing = Listing.find(params[:id])

    # if our listing is complete,
    # we should only be able to access this page
    # when we're logged in with an appropriate account
    if @listing.status == 1
      authenticate_user!

      # here we check if our current user is either of the users in the trade
      if current_user.id != @listing.user_id && current_user.id != (@listing.bids.find_by status: 1).user_id
        # if we aren't, we redirect to root
        redirect_to root_path
      end
    end

    @game = Game.find(@listing[:game_id])
    @new_message = Message.new
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
      images: params[:listing][:images],
      status: 0
    })
    if @listing.valid?
      redirect_to root_path(Game: Game.find(params[:game_id]).name)
    else
      puts @listing.errors.full_messages
      redirect_to new_listing_path(id: params[:game_id])
    end
  end

  def initialize_game
    @listing = Listing.find(params[:id])
    @game = Game.find(@listing[:game_id])
  end

  def accept_bid
    puts 'accepting bid'
    @bid = Bid.find(params[:id])
    @listing = Listing.find(@bid.listing_id)
    @game = Game.find(@listing.game_id)
    @listing.update(status: 1)
    @bid.update(status: 1)

    redirect_to root_path(@game.name)
  end

  private
  
  def listing_params
    params.require(:listing).permit(:title, :description, :game_id)
  end
end
