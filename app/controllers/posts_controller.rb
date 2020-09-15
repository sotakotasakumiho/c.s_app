class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]
  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @messages = @post.messages.includes(:user).order(created_at: :desc)
    @message = Message.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to root_path
    else
      redirect_to  root_path
    end
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end