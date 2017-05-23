class Article < ActiveRecord::Base
  # Validates article titles and descriptions
  validates :title, presence: true, 
            length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, 
            length: { minimum: 10, maximum: 1500 }
end