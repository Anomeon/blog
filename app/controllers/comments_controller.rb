class CommentsController < ApplicationController

  before_filter :require_login, only: [:destroy, :new, :edit, :update]

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
    #хеш params как большой кусок сыра, от которого все могут что то отхватить. Почему у @post в params :post_id? Потому что если мы используем просто :id то это будет :id комментария. Чтобы получить :id поста, нужно именно :post_id, а для user соотвественно :user_id
    @post = Post.find(params[:post_id])    
    @comment = @post.comments.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])    
    @comment = @post.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to user_post_path(params[:user_id], params[:post_id])
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
      redirect_to user_post_path(current_user, @post.id)
  end


  private

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
