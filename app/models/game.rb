class Game < ApplicationRecord
    has_many :listings, :dependent => :destroy
end
