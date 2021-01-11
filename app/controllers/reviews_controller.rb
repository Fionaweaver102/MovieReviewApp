class ReviewsController < ApplicationController

  before do
    require_login
  end 
  
  get '/reviews/new' do 
    require_login
    erb :'reviews/new'
  end 

  post '/reviews/new' do 
    reviews = current_user.reviews.build(params)
    if reviews.save 
      redirect '/reviews'
    else 
      @error = "Sorry, invalid data, please try again!"
      erb :'reviews/new'
    end 
  end 
  
  get '/reviews' do  
    @reviews = Review.all.reverse 
    erb :'reviews/index'
  end 

  get '/reviews/:id' do 
    @reviews = Review.find_by(id: params[:id])
    if @reviews
    erb :'reviews/show'
    else 
    redirect '/reviews'
    end 
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