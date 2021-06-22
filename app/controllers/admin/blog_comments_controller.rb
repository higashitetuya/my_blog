class Admin::BlogCommentsController < ApplicationController
  def create
    @blog = Blog.find(params[:blog_id])
    @blog_comment = current_user.blog_comments.new(blog_comment_params)
    @blog_comment.blog_id = @blog.id
    @blog_comment.save
    redirect_to admin_blog_path(@blog.id)
  end

  def destroy
    BlogComment.find_by(id: params[:id], blog_id: params[:blog_id]).destroy
    redirect_to admin_blog_path(params[:blog_id])
  end

   private

  def blog_comment_params
    params.require(:blog_comment).permit(:blog_comment)
  end
end
