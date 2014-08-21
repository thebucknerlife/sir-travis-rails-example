class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to posts_path
    else
      flash[:errors] = @post.errors.full_messages.to_sentence
      render :edit
    end
  end

  def create 
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      flash[:errors] = @post.errors.full_messages.to_sentence
      render :new
    end
  end

private

  def post_params
    params.require(:post).permit(:content, :poster)
  end

end