class AddBidToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :bids, null: false, foreign_key: true
  end
end