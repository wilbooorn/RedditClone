class PostsController < ApplicationController
  before_action :require_login

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.user_id != current_user.id
      flash.now[:errors] = ["You can only edit your own posts"]
      redirect_to post_url(@post)
    elsif @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      redirect_to post_url(@post)
    end

  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to subs_url
  end

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
end
