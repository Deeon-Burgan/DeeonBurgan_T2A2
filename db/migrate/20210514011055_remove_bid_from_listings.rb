class RemoveBidFromListings < ActiveRecord::Migration[6.1]
  def change
    remove_reference :listings, :bids, null: false, foreign_key: true
  end
end
