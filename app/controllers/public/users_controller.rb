class Public::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @blogs = Blog.all
    @admin = Admin.find(2)
  end

  def edit
  end
end
