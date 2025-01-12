class Game < ApplicationRecord
    has_one_attached :image
    has_many :strategies, dependent: :destroy
end
