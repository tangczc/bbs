class IssuesController < ApplicationController
  #展示活动以及活动评论
  def show
  	   @issue = Issue.find(params[:id])
       @comments = @issue.comments
  end
  #删除活动
  #跳转主页面
  def destroy
	  issue = Issue.find(params[:id])
	  issue.destroy
	  redirect_to :root
  end
  #活动创建页面
  def new
    if not current_user
      flash[:notice] = "请先登录"
      redirect_to :root
      return
    else
      @issue = Issue.new
    end
  end
  #创建活动
  def create
  	Issue.create(issue_params)
  	redirect_to :root
  end
  #编辑活动界面
  def edit
  	@issue = Issue.find(params[:id])
  end
  #修改活动
  def update
	  i = Issue.find(params[:id])
	  i.update_attributes(issue_params)
	  redirect_to :root
  end
  private
	  def issue_params
	    params.require(:issue).permit(:title, :content, :user_id)
	  end
end
