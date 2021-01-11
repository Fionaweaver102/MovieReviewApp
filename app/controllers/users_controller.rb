class UsersController < ApplicationController

  get '/signup' do 
    erb :'users/signup'
  end 

  post '/signup' do
    user = User.new(params)
    if user.save 
      session[:user_id] = user.id
      redirect '/reviews'
    else 
      @error = "Invalid Input"
      erb :'users/signup'
    end 
  end 

end 