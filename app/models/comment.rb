class Comment < ApplicationRecord
    
    belongs_to :strategy
    belongs_to :user
    
    validates :comment, presence: true
    
end
