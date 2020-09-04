class AccountActivationsController < ApplicationController
    def edit
        user = User.find_by(email: params[:email])
        if user && !user.activated? && user.authenticated?(:activation, params[:id])
          user.activate
          log_in user
          flash[:success] = "Tài khoản của bạn đã được kích hoạt!"
          redirect_to user
        else
          flash[:danger] = "Liên kết kích hoạt không hợp lệ!"
          redirect_to root_url
        end
    end
end
