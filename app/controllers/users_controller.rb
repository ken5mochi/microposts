class UsersController < ApplicationController
  before_action :logged_in_user, except: [:new, :create, :show]
  before_action :set_current_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
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
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash.now[:success] = "プロフィールを編集しました"
      render 'edit'
      # redirect_to @user
    else
      flash.now[:danger] = "プロフィールの更新に失敗しました"
      render 'edit'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :profile, :location, :password, :password_confirmation)
  end

  def set_current_user
    @user = current_user
  end

end
