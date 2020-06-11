class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @post = Post.new
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    unless  @post.save
      flash.alert = "Title and body can not be empty!" 
    end
    redirect_to root_path
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
  
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end