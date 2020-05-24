class PostsController < ApplicationController

  def index
    @posts = Post.all
    # @posts = Post.all.map { |post| "#{post.title} #{post.content}"}.join("\n")
    # render plain: @posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, flash: { success: "Post was created" }
    else
      render :new, flash: { alert: "Some error occured"}
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path, flash: { success: "Post was updated" }
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to action: :index
    # redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image)
  #  TODO: later add another filters such as likes, images etc.
  end

end
