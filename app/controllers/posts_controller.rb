class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :upvote]


  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new post_params
    @user = current_user
    @user.posts << @post
    if @post.save
      redirect_to post_path(@post.id), notice: "Successfully created new post!"
    else
      render 'new'
    end
  end

  def update
    if @post.update post_params
      redirect_to post_path(@post.id), notice: "Post updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def upvote
    @post.upvote_by current_user
    redirect_to :back
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:background, :stylesheet, :image, :description)
    end
end
