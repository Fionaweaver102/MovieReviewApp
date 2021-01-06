class ReviewsController < ApplicationController

  get '/reviews' do 
    @reviews = Review.all 
    erb :'reviews/index'
  end 

  get '/reviews/:id' do 
    @recipe = Recipe.find()
  end 


end 