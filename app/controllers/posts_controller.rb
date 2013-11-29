class PostsController < ApplicationController

  before_filter :require_login, only: [:edit, :update, :destroy, :new]
  before_filter :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.where('user_id = ?', params[:user_id])
  end

  def new
    @tags = Tag.all
    @post = Post.new
  end

  def create
    @tags = Tag.all
    @post = current_user.posts.create(post_params)
    @tag.posts << @post
    if @post.save
      flash[:success] = 'post created!'
      redirect_to user_posts_path(current_user)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = 'post updated!'
      redirect_to user_post_path(current_user, params[:id])
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy

    redirect_to user_posts_path(current_user),
                  alert: "Post was deleted"
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

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
