class PostsController < ApplicationController

  before_filter :require_login, only: [:edit, :update, :destroy, :new]

  def index
    @posts = Post.where('user_id = ?', params[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      flash[:success] = 'post created!'
      redirect_to user_posts_path(current_user)
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = 'post updated!'
      redirect_to user_post_path(current_user, params[:id])
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to user_posts_path(current_user),
                  alert: "Post was deleted"
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :email, :user_id, :body)
  end

  def require_login
    unless user_signed_in?
      redirect_to root_url,
                  alert: "Please, Sign In first!"
    end
  end

end
