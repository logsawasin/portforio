class Strategy < ApplicationRecord
    
    has_many :comments
    belongs_to :game
    
end
