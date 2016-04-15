class PostsController < ApplicationController

  before_action :find_by_id, only: [:show, :edit, :update, :destroy ]
  # before_filter :authorize, only: [:new, :create, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]


  def index
    @post = Post.last
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      respond_to do |format|
        format.html do
          if format.xhr?
            render @post
          end
        end
        format.js { render js: "window.location = '#{posts_url}';"}
      end
    else
      render :new, notice: "Sorry there was an error. Please try again."
    end

  end

  def show
    @comments = @post.comments
    if current_user
      @comment = Comment.new
    end
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post.delete
    redirect_to posts_path
  end

  private

    def post_params
      params.require(:post).permit(:title, :blog_post)
    end

    def find_by_id
        @post = Post.find(params[:id])
    end


end
