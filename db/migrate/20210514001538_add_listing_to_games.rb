class AddListingToGames < ActiveRecord::Migration[6.1]
  def change
    add_reference :games, :listings, null: false, foreign_key: true
  end
end
