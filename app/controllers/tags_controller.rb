class TagsController < ApplicationController

  before_filter :require_login, only: [:edit, :update, :destroy, :new]
  before_filter :find_tag, only: [:show, :edit, :update, :destroy]
  before_filter :all_tags, only: [:show, :index]

  def index
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.create(tag_params)
    if @tag.save
      redirect_to tags_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @tag.update(tag_params)
      redirect_to tags_path
    else
      flash[:error] = "Tag name can't be blank"
      render 'edit'
    end
  end

  def show
    @users = User.all
    @posts = @tag.posts
  end

  def destroy
    @tag.destroy
    redirect_to tags_path, alert: "Tag was deleted"
  end

  private

  def find_tag
    @tag = Tag.find(params[:id])
  end



  def tag_params
    params.require(:tag).permit(:tag_text, :post_id, :user_id)
  end

end

