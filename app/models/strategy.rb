class Strategy < ApplicationRecord
    has_one_attached :image
    has_many :comments, dependent: :destroy
    belongs_to :game
    belongs_to :user
    belongs_to :admin
    
    validates :title, presence: true
    validates :body, presence: true
    validates :game_id, presence: true
    
end
