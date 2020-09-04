class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :destroy]
  #before_action :correct_user
  before_action :admin_user,     only: :destroy
  def show
    @user = User.find(params[:id])
  end
  def report
    @user = User.find(params[:id])
  end
  def index
    @users = User.paginate(page: params[:page],per_page: 4)
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    @user.image.attach(params[:user][:image])
    if @user.save
      @user.send_activation_email
      flash[:info] = "Vui lòng kiểm tra email của bạn để kích hoạt tài khoản."
      redirect_to root_url
    else
      render 'new'
    end
  end
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Người dùng đã được xóa."
    redirect_to users_url
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # Handle a successful update.
      flash[:success] = "Hồ sơ người dùng đã được cập nhật!"
      redirect_to @user
    else
      render "edit"
    end
  end

  private
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Vui lòng đăng nhập."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    #def correct_user
      #@user = User.find(params[:id])
      #redirect_to(root_url) unless current_user?(@user)
    #end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
    end
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
