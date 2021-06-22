class Admin::AdminBlogCommentsController < ApplicationController
  def create
    @blog = Blog.find(params[:blog_id])
    @admin_blog_comment = current_admin.admin_blog_comments.new(admin_blog_comment_params)
    @admin_blog_comment.blog_id = @blog.id
    @admin_blog_comment.save
    redirect_to admin_blog_path(@blog.id)
  end

  def destroy
    AdminBlogComment.find_by(id: params[:id], blog_id: params[:blog_id]).destroy
    redirect_to admin_blog_path(params[:blog_id])
  end

  private

  def admin_blog_comment_params
    params.require(:admin_blog_comment).permit(:admin_blog_comment)
  end

end
