class RemoveBidFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_reference :users, :bids, null: false, foreign_key: true
  end
end
