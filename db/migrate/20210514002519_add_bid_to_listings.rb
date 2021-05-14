class AddBidToListings < ActiveRecord::Migration[6.1]
  def change
    add_reference :listings, :bids, null: false, foreign_key: true
  end
end
