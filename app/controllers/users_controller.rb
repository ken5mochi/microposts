class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :bookmarks, :followings, :followers]
  before_action :user_check, only: [:edit, :update]

  def index
    @user = current_user
    @users = User.all.order(created_at: :desc)
  end

  def show
    @feed_items = @user.microposts.order(created_at: :desc).page(params[:page])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "プロフィールを編集しました"
      redirect_to @user
    else
      flash.now[:danger] = "プロフィールの更新に失敗しました"
      render 'edit'
    end
  end

  def bookmarks
    @feed_items = @user.bookmarking_microposts.order(created_at: :desc).page(params[:page])
  end

  def followings
    @users = @user.following_users.order(created_at: :desc)
  end
  
  def followers
    @users = @user.follower_users.order(created_at: :desc)
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :profile, :location, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_check
    unless current_user == @user
      flash[:success] = "URLが不正です"
      redirect_to root_path
    end
  end

end
