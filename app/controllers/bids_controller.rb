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
      @listing = Listing.find(params[:listing_id])
      @user = User.find(@listing.user_id)
      send_new_bid_email(@user, @bid)
      
      redirect_to "/listings/#{params[:listing_id]}"
    else
      puts @bid.errors.full_messages
      # render :new
    end
  end

  def edit

  end

  def send_new_bid_email(user, bid)
    RestClient.post "https://api:e40164ae8415199ccc60c52dfe69ca51-6ae2ecad-9f7a429c"\
    "@api.mailgun.net/v3/sandboxcbc35ff313e64215b6f6548e143339fb.mailgun.org/messages",
    :from => "mailgun@sandboxcbc35ff313e64215b6f6548e143339fb.mailgun.org",
    :to => user.email,
    :subject => "Your listing has a new bid: " + bid.title,
    :text => bid.description
  end

  private
  def bid_params
    params.require(:bid).permit(:title, :description, :listing_id)
  end
end
