class PageController < ApplicationController
  #主页面
  def welcome
  	 #把所有活动通过创建时间排序
  	 @issues  = Issue.all.reverse
  end
end