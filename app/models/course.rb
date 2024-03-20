class Course < ApplicationRecord
    has_many :posts
    has_many :chapters
    validates :title, presence: true
    validates :author, presence: true
    validates :length, presence: true
    validates :desc, presence: true
    validates :author_info, presence: true
    validates :body, presence: true
    
    def self.search(search)
        if search
            where(["title LIKE ?", "%#{search}%"])
        else
            all
        end
    end
    
end