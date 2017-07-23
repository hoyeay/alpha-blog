class Category < ActiveRecord::Base
  
  # associates
  has_many :article_categories
  has_many :articles, through: :article_categories
  # validates that a user name is present and 
  # meets minimum and maximum characters
  validates :name, 
            presence: true, 
            length: { minimum: 3, maximum: 20 }
  # validate uniqueness of user name
  validates_uniqueness_of :name
end