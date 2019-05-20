class Api::V1::UsersController < ApplicationController
  include Rails.application.routes.url_helpers
  before_action :find_user, only: [:update, :show, :destroy]

  def avatar
   
    @avatars = Dir.glob("/Users/demiansims/Development/Faunagram/faunagram-api/app/assets/images/avatars/*.png")
    @avatars.sample
  end


  def index
   @users = User.all
    render json: @users, status: :accepted
  end


  def create
    @user = User.new(
      name: params[:name],
      username: params[:username],
      password: params[:password]
    )
    if @user.save
     @user.avatar.attach(io: File.open(avatar), filename: 'avatar.png')
      render json: {user: UserSerializer.new(@user), token: Rails.application.credentials.jwt}, status: :ok
    else
      render json: {errors: @user.errors.full_messages}
    end
  end


  def show
    if @user
      if curr_user.id == @user.id
        render json: @user
      else
        render json: {errors: @user.errors.full_messages }, status: :unprocessible_entity
      end
    else
      render json: {errors: "User not found!"}
    end
  end


  def update
    if curr_user.id == @user.id
      @user.update(user_params)
      if @user.save
      render json: @user, status: :accepted
      else
     render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
      end
    end
  end


  def destroy
    if curr_user.id == @user.id
      @user.delete
      render json: "user deleted", status: :ok
    else
      render json: { errors: "You are not authorized to delete"}
    end
  end

  private

  def user_params
   params.permit(:name, :username, :password, :avatar)
  end


  def find_user
   @user = User.find(params[:id])
  end

end
