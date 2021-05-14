class RemoveListingFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_reference :users, :listings, null: false, foreign_key: true
  end
end
