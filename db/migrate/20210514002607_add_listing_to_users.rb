class AddListingToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :listings, null: false, foreign_key: true
  end
end
