class PageController < ApplicationController
  def welcome
  	 @issues  =  @issues = Issue.all
  end
end