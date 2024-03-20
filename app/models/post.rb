class Post < ApplicationRecord
    belongs_to :course
    belongs_to :user
    
    validates :title, presence: true
    validates :body, presence: true
    validates :rating, presence: true
end
