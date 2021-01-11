class Review < ActiveRecord::Base 
  belongs_to :user
  validates_presence_of :name, :movie_title, :review_description, :date_published 
end 