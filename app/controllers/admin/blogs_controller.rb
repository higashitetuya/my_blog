class Admin::BlogsController < ApplicationController

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.admin_id = current_admin.id
    @blog.save
    redirect_to admin_path
  end

  def show
  end

  def edit
  end

  private

  def blog_params
    params.require(:blog).permit(:image, :title, :body)
  end
end
