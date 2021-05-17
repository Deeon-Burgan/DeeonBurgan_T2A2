class BidsController < ApplicationController

  before_action :authenticate_user!, only: [:new]

  def new
    @listing = Listing.find(params[:id])
    @bid = Bid.new
  end

  def create
    @bid = current_user.bids.create({
      listing_id: params[:listing_id],
      title: params[:bid][:title],
      description: params[:bid][:description]
    })
    if @bid.valid?
      redirect_to "/listings/#{params[:listing_id]}"
    else
      puts @bid.errors.full_messages
      # render :new
    end
  end

  def edit

  end

  private
  def bid_params
    params.require(:bid).permit(:title, :description, :listing_id)
  end
end
