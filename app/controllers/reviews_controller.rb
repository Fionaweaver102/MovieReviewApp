class ReviewsController < ApplicationController

  get '/reviews/new' do 
    if logged_in?
    erb :'reviews/new'
    else 
      redirect '/login'
    end 
  end 

  post '/reviews/new' do 
    reviews = current_user.reviews.build(params)
    if !reviews.movie_title.empty? && !reviews.review_description.empty?
      reviews.save
      redirect '/reviews'
    else 
      @error = "Sorry, invalid data, please try again!"
      erb :'reviews/new'
    end 
  end 
  
  get '/reviews' do  
    if logged_in?
    @reviews = Review.all.reverse 
    erb :'reviews/index'
    else 
      redirect '/login'
    end
  end 

  get '/reviews/:id' do 
    if logged_in?
    @reviews = Review.find(params[:id])
    erb :'reviews/show'
    else 
      redirect '/login'
    end 
  end 

  get '/reviews/:id/edit' do 
    if logged_in?
    @reviews = Review.find(params[:id])
    erb :'reviews/edit'
    else 
      redirect '/login'
    end 
  end 


  patch '/reviews/:id' do 
  if logged_in? 
    @reviews = Review.find(params[:id])
    if !params["review"]["movie_title"].empty? && !params["review"]["review_description"].empty?
      @reviews.update(params["review"])
      redirect "/reviews/#{params[:id]}"
    else 
      @error = "Sorry, invalid data, please try again!"
      erb :'reviews/edit'
    end 
  else 
    redirect '/login'
  end 
  end 

  delete '/reviews/:id' do 
    if logged_in?
    @review = Review.find(params[:id])
    @review.destroy 
    redirect '/reviews'
    else 
      redirect logged_in?
    end 
  end 
  


end 