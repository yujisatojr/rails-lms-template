class Article < ApplicationRecord
    has_many :comments
    belongs_to :user

    validates :title, presence: { message: "Please enter a title." }
    validates :body, presence: { message: "Please enter the content of the question." }
end
