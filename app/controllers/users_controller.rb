class UsersController < ApplicationController

  get '/signup' do 
    erb :'users/signup'
  end 

  post '/signup' do
    user = User.new(params)
    if !user.save 
      @error = "Invalid Input"
      erb :'users/signup'
    else 
      session[:user_id] = user.id
      redirect '/reviews'
    end 
  end 

end 