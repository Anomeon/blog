class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.create(tag_params)
  end

  private

  def tag_params
    params.require(:tag).permit(:tag_text, :post_id, :user_id)
  end
end

