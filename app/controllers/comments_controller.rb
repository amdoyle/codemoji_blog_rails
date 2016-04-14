class CommentsController < ApplicationController

  before_action :load_post

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user


    if @comment.save
      respond_to do |format|
          format.html do
            if request.xhr?
              render @comment
            else
              redirect_to post_path(@post), notice: "Your comment was saved"
            end
          end
      format.js
      end
    else
      render :new, notice: "Your comment was not saved. Please try again."
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
