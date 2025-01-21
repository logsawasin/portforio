class Strategy < ApplicationRecord
    has_one_attached :image
    has_many :comments, dependent: :destroy
    belongs_to :game
    belongs_to :user
    
end
