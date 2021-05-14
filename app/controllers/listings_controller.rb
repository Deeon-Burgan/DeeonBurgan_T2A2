class ListingsController < ApplicationController
  def index
    @listings = Listing.find(params[:id])
  end

  def show
  end

  def new
  end

  def update
  end
end
