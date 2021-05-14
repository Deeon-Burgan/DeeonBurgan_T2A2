class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :bids, :dependent => :destroy
end
