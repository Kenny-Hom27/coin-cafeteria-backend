class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, status: 200
  end

  def show
    @user = User.find_by(id: params[:id])
    render json: @user, status: 200
  end

  def create
    @user = User.new(username: params[:username], password: params[:password])
    if @user.valid?
      @user.save
      token = issue_token({ 'user_id': @user.id})
      render json: {'token': token }
    else
      render json: {'error': 'Username already exists! Try again.'}
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    render json:@user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: {message: "Removed From Favorite!"}
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
