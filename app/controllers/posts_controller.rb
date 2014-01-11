class PostsController < ApplicationController

  before_filter :require_login, only: [:edit, :update, :destroy, :new]
  before_filter :find_post, only: [:show, :edit, :update, :destroy]
  before_filter :all_tags, only: [:show, :new, :create, :edit, :update]
  # :all_tags in application controller

  def index
    @posts = Post.where('user_id = ?', params[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      if @tag = params[:post][:t_ids]
        @tag.each do |t|
          tag = Tag.find t
          tag.posts << @post
        end
      end
      flash[:success] = 'post created!'
      redirect_to user_posts_path(current_user)
    else
      render 'new'
    end
  end

  def show
    @tag = @post.tags
  end

  def edit
  end

  def update
    if @post.update(post_params)
      @tag = params[:post][:t_ids]  # вытаскиваем из params id-шники

        i = true
        @post.tags.each do |p|      # вытаскиваем из бд все тэги связанные с постом
          if i == false             # переменная i принимает true изначально и еще в том случае, когда в params нет id который есть у поста в бд. В else связь тега с постом будет удалена
            @tag.each do |t|        # пробегаемся по params с id-шниками
              if p.id.to_s == t     # если у поста уже есть этот тег, то присвой false и ничего не делай
                i = false
              end
            end
          else
            @category = PostTagAssigment.where(post_id: params[:id], tag_id: p).first # поиск необходимой связи в таблице Categories
            @category.destroy
          end
        end

        unless @tag.nil?
          @tag.each do |t|
            unless @post.tags.exists?(id: t)
              tag = Tag.find t
              tag.posts << @post
            end
          end
        end

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
    params.require(:post).permit(:title, :text, :email, :user_id, :body, :tag_ids => [])
  end

end
