class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :bids, :dependent => :destroy
  has_many_attached :images
end
