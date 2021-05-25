class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :bids, :dependent => :destroy
  has_many_attached :images
  has_many :messages, :dependent => :destroy

  validates :title, :description, presence: true
end
