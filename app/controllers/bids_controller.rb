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
      description: params[:bid][:description], 
      status: 0
    })
    if @bid.valid?
      @listing = Listing.find(params[:listing_id])
      @user = User.find(@listing.user_id)

      # THIS DOES WORK BUT MY ACCOUNT IS CURRENTLY LOCKED, SO IT DOESN'T 
      # send_new_bid_email(@user, @bid)

      redirect_to "/listings/#{params[:listing_id]}"
    else
      puts @bid.errors.full_messages
      # render :new
    end
  end

  def edit

  end

  def send_new_bid_email(user, bid)
    RestClient.post "https://api:7afa5c1ad7dcc3a280e2f2c6a1a433bf-fa6e84b7-2e0a36d8"\
    "@api.mailgun.net/v3/deeonburgan.me/messages",
    :from => "mailer@deeonburgan.me",
    :to => user.email,
    :subject => "Your listing has a new bid: " + bid.title,
    :text => bid.description
  end

  private

  def bid_params
    params.require(:bid).permit(:title, :description, :listing_id)
  end
end
