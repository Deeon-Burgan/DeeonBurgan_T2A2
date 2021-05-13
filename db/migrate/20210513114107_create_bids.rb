class CreateBids < ActiveRecord::Migration[6.1]
  def change
    create_table :bids do |t|
      t.references :user, null: false, foreign_key: true
      t.references :listing, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.integer :status

      t.timestamps
    end
  end
end
