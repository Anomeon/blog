class CommentsController < ApplicationController

  before_filter :require_login, only: [:destroy, :new, :edit, :update]
  before_filter :find_comment, only: [:edit, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to user_post_path(@post.user.id, @post.id)
    else
      redirect_to user_post_path(@post.user.id, @post.id)
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to user_post_path(params[:user_id], params[:post_id])
    else
      render 'edit'
    end
  end

  def destroy

    @comment.destroy
      redirect_to user_post_path(current_user, @post.id)
  end


  private

  def find_comment
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id, :email)
  end

  def require_login
    unless user_signed_in?
      redirect_to root_url,
                  alert: "Please, Sign In first!"
    end
  end

end
