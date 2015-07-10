class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      # 登入用户，然后重定向到用户的资料页面
      log_in @user
      redirect_to url_after_login
    else
      # 创建一个错误消息
      #flash[:danger] = 'Invalid email/password combination'
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to static_pages_home_path
  end

private

  def url_after_login
    params[:back_url] || backend_speakers_path
  end

end
