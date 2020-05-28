class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user

  def index
    @posts = @user.posts
    # @posts = Post.all
    # @posts = Post.all.map { |post| "#{post.title} #{post.content}"}.join("\n")
    # render plain: @posts
  end

  def show
    @post = @user.posts.find(params[:id])
    # @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    # @post.user = @user
    @user = @post.user
    if @post.save
      redirect_to user_post_path(@user, @post), flash: { success: "Post was created" }
    else
      render :new, flash: { alert: "Some error occured"}
    end
  end

  def edit
    @post = @user.posts.find(params[:id])
  end

  def update
    @post = @user.posts.find(params[:id])
    # @post.user = @user
    @user = @post.user
    if @post.update(post_params)
      redirect_to user_post_path(@user, @post), flash: { success: "Post was updated" }
    else
      render 'edit'
    end
  end

  def destroy
    @post = @user.posts.find(params[:id])
    @post.destroy
    redirect_to action: :index
    # redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image, :user_id)
  #  TODO: later add another filters such as likes, images etc.
  end
end
