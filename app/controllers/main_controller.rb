class MainController < ApplicationController
  def index
    @games = Game.all.map do |game|
      game.name
    end

    # Do this stuff if we've chosen a game
    unless params[:Game].nil?
      @game = Game.find_by name: params[:Game]
      @listings = @game.listings.all
    end
  end
end
