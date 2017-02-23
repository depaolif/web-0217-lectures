class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
  #users/new
  get '/users/new' do
    erb :new
  end

  # create
  post '/users' do
    @user = User.create(params[:user])
    erb :show
  end

  # index
  get '/users' do
    erb :index
  end

  # show
  get '/users/:id' do
    @user = User.find(params[:id])
    erb :show
  end

  # edit
  get '/users/:id/edit' do
    @user = User.find(params[:id])
    erb :edit
  end

  # update
  patch '/users/:id' do
    @user = User.find(params[:id])
    @user.update(params[:user])
    # params[:user] will here be the new edits submitted from the edit.erb page
    erb :show
  end

  # destroy
  delete '/users/:id' do
    User.delete(params[:id])
    redirect '/users'
  end

end


# Write the controller action as if this was a rails controller
# Write the url that sends a user to the action. I have done the first one for you.
# ^--what url has already been done??
