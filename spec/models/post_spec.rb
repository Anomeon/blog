require 'spec_helper'

describe Post do

  it "Checking association post with comment" do
    user1 = create(:user)
    post1 = create(:post)
    comment1 = create(:comment)
    user1.comments << comment1
    post1.comments << comment1
    user1.id.should == comment1.user_id
    post1.id.should == comment1.post_id
  end

  # it "Checking association post with tag" do
    # post1 = create(:post)
    # tag1 = create(:tag)
    # tag1.posts << post1
    # puts Category.post_id
    # # tag1.id.should == 
  # end
end