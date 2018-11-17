class UsersController < ApplicationController
  def signup
  	@user = User.new
  end
  def create
  	@user = User.new(user_params)
  	if @user.save
  		cookies[:auth_token] = @user.auth_token
  		redirect_to :root
  	else
  		render :signup
  	end
  end
  def login
  	@user = User.new
  end
  def login_create
  	user = User.find_by_name(params[:name])
  	if user && user.authenticate(params[:password])
	    if params[:remember_me]
	    	cookies.permanent[:auth_token] = user.auth_token
	    else
	    	cookies[:auth_token] = user.auth_token
	    end
	    flash.notice = "登陆成功"
	    redirect_to :root
  	else
  		flash.notice = "用户名或密码输入错误"
    	redirect_to :login
  	end
  end
  def logout
  	cookies.delete(:auth_token)
  	redirect_to :root
  end
  private
  	def user_params
  		params.require(:user).permit!
  	end
end
