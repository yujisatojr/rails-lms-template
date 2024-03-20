class Chapter < ApplicationRecord
    belongs_to :course

    validates :title, presence: true
    validates :length, presence: true
    validates :body, presence: true
end
