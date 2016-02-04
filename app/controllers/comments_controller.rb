class CommentsController < ApplicationController

  before_action :load_post

  def new
    @comment = Comment.new
  end

  def create

    @comment = @post.comments.build(comment_params)

    if @comment.save
      redirect_to post_path(@post), notice: "You have successfully commented on this blog post"
    else
      render :new
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
    params.require(:comment).require(:comment)
  end

  def load_post
    @post = Post.find(params[:post_id])
  end

end
