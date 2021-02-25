class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @commented_posts = @user.comments.map{|c| c.post}.uniq
  end

end
