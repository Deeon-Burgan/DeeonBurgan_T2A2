class RemoveListingFromGames < ActiveRecord::Migration[6.1]
  def change
    remove_reference :games, :listings, null: false, foreign_key: true
  end
end
