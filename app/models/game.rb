class Game < ApplicationRecord
    has_one_attached :image
    has_many :strategies, dependent: :destroy
    
    validates :title, presence: true
    validates :body, presence: true
    validates :tag, presence: true
    validates :image, presence: true
    
end
