class ReviewsController < ApplicationController

  get '/reviews/new' do 
    erb :'reviews/new'
  end 

  post '/reviews/new' do 
    review = Review.new(params)
    if !review.movie_title.empty? && !review.review_description.empty?
      review.save
      redirect '/reviews'
    else 
      @error = "Sorry, invalid data, please try again!"
      erb :'reviews/new'
    end 
  end 
  
  get '/reviews' do 
    @reviews = Review.all 
    erb :'reviews/index'
  end 

  get '/reviews/:id' do 
    @reviews = Review.find(params[:id])
    erb :'reviews/show'
  end 

  get '/reviews/:id/edit' do 
    @reviews = Review.find(params[:id])
    erb :'reviews/edit'
  end 


  patch '/reviews/:id' do 
    @reviews = Review.find(params[:id])
    if !params["review"]["movie_title"].empty? && !params["review"]["review_description"].empty?
      @reviews.update(params["review"])
      redirect "/reviews/#{params[:id]}"
    else 
      @error = "Sorry, invalid data, please try again!"
      erb :'reviews/edit'
    end 
  end 

  delete '/reviews/:id' do 
    @review = Review.find(params[:id])
    @review.destroy 
    redirect '/reviews'
  end 
  


end 