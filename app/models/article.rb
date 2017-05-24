class Article < ActiveRecord::Base
  
  # associate articles to 1 user
  belongs_to :user
  
  # Validates article titles and descriptions
  validates :title, presence: true, 
            length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, 
            length: { minimum: 10, maximum: 1500 }
  
  # a user_id (a user) must be present for an article to be created
  validates :user_id, presence: true
end