class Game < ApplicationRecord
    has_many :listings, :dependent => :destroy

    validates :name, uniqueness: true
end
