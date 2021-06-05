class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  skip_before_action :login_required, only: [:new, :create]
  before_action :ensure_current_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "プロフィール画像を変更しました！"
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_image)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def ensure_current_user
    if @current_user.id != @blog.user.id
      flash[:notice]="権限がありません"
      redirect_to blogs_path
    end
  end

end
