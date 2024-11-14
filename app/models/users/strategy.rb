class Strategy < ApplicationRecord
    
    has_many :comment
    belongs_to :game
    
end
