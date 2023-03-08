class Book < ApplicationRecord
    
    belongs_to :user
    
    validates :title, :body,  presence: true
    validates :body, length: { in:1..200 }
    validates :title, length: { in:1..20 }
    
end

