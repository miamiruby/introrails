class PostsController < ApplicationController
  def index
      @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    Post.destroy(params[:id])
    flash[:notice] = 'Post was deleted!'
    redirect_to posts_path
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id if current_user
    if @post.save
      flash[:notice] = 'Post created successfully!'
      redirect_to post_path(@post)
    else
      flash.now[:error] = 'Please fix your errors!'
      render "new"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash.now[:notice] = 'Post updated successfully!'
      render "edit"
    else
      flash.now[:alert] = 'Sorry there is a problem!'
      render "edit"
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end

end
