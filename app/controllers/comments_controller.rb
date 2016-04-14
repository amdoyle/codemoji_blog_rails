class CommentsController < ApplicationController

  before_action :load_post

  def new
    @comment = @post.comments.new
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      respond_to do |format|
        format.html { redirect_to post_path(@comment),
              notice: "You have successfully commented on this blog post" }
        format.js {}
        format.json { render json: @comment, status: :created }
      end
    else
      respond_to do |format|
        format.html { render partial: "new_comment_form",
              notice: "Sorry your comment was not saved" }
        format.json { render 'new' }
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def updated
    @comment = Comment.find(params[:id])
    if comment.update_attributes(comment_params)
      redirect_to post_path(@post), notice: "You have successfully updated your comment"
    else
      render :edit
    end
  end

  def destory
    @comment = Comment.find(params[:id])
    @comment.destory
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :blog_id)
  end

  def load_post
    @post = Post.find(params[:post_id])
  end

end
