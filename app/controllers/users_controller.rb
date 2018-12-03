class UsersController < ApplicationController
  #注册界面
  def signup
  	@user = User.new
  end
  #展示所有用户
  def index
    if not current_user && current_user.admin == "true"
      flash[:notice] = "请用管理员用户登录"
      redirect_to :login
      return
    else
      @users = User.all
    end
  end
  #注册
  #cookies用于标识用户状态
  def create
  	@user = User.new(user_params)
  	if @user.save
  		cookies[:auth_token] = @user.auth_token
  		redirect_to :root
  	else
  		render :signup
  	end
  end
  #登陆界面
  def login
  	@user = User.new
  end
  #登陆
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
  #编辑用户界面
  def edit
    @user = User.find(params[:id])
  end
  #更新用户
  def update
    u = User.find(params[:id])
    u.update_attributes(user_params)
    flash.notice = "修改用户成功"
    redirect_to :show
  end
  #登出
  def logout
  	cookies.delete(:auth_token)
  	redirect_to :root
  end
  #删除用户(注：管理员才可以)
  def destroy
    user = User.find(params[:id])
    user.destroy
    flash.notice = "用户删除成功"
    redirect_to :show
  end
  #用户主页
  def show_user
    if current_user
      @current_user = current_user
    else
      redirect_to :root
    end
  end
  private
  	def user_params
  		params.require(:user).permit!
  	end
end
