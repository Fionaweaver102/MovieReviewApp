class SessionsController < ApplicationController
  get '/login' do 
    erb :'users/login'
  end 

  post '/login' do 
    
    if params["username"].empty? || params["password_digest"].empty?
      @error = "Invalid Input"
      erb :'users/login' 

    else 
      if user = User.find_by(username: params["username"], password_digest: params["password_digest"])
        session[:user_id] = user.id
        redirect '/reviews'
      else 
        @error = "Account not found. Please try again."
        erb :'users/login'
      end 

    end 

  end 

  get '/logout' do 
    session.clear
    redirect '/'
  end 

end