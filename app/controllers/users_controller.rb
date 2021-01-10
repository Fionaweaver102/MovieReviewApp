class UsersController < ApplicationController

  get '/signup' do 
    erb :'users/signup'
  end 

  post '/signup' do
    user = User.new(params)
    if  user.username.empty? || user.password_digest.empty?
      @error = "Invalid Input"
      erb :'users/signup'
    elsif User.find_by(username: user.username)
      @error = "Account already exists."
      erb :'users/signup'
    else 
      user.save 
      session[:user_id] = user.id
      redirect '/reviews'
    end 
  end 

end 