class TagsController < ApplicationController
  
  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.create(tag_params)
    if @tag.save
      redirect_to new_tag_path
    end
  end

  def show
    @tags = Tag.all
    @users = User.all
    @tag = Tag.find(params[:id])
    @posts = @tag.posts
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to tags_path, alert: "Tag was deleted"
  end

  private

  def tag_params
    params.require(:tag).permit(:tag_text, :post_id, :user_id)
  end
end

