class Game < ApplicationRecord
    has_many :strategies, dependent: :destroy
end
