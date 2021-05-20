class AddListingToMessages < ActiveRecord::Migration[6.1]
  def change
    add_reference :messages, :listing, null: false, foreign_key: true
  end
end
