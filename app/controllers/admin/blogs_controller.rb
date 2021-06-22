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
    @blog = Blog.find(params[:id])
    @blog_comment = BlogComment.new
    @admin_blog_comment = AdminBlogComment.new
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.update(blog_params)
    redirect_to admin_blog_path(@blog.id)
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to admin_path
  end

  private

  def blog_params
    params.require(:blog).permit(:image, :title, :body)
  end
end
