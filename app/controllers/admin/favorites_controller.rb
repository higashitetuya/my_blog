class Admin::FavoritesController < ApplicationController
  def create
    blog = Blog.find(params[:blog_id])
    favorite = current_user.favorites.new(blog_id: blog.id)
    favorite.save
    redirect_to admin_blog_path(blog)
  end

  def destroy
    blog = Blog.find(params[:blog_id])
    favorite = current_user.favorites.find_by(blog_id: blog.id)
    favorite.destroy
    redirect_to admin_blog_path(blog)
  end
end
