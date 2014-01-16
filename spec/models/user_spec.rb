require 'spec_helper'

describe User do

  it "Checks association user with post" do
    post1 = FactoryGirl.create(:post)
    post1.user.posts.any?.should == true
  end

  it "Deletes user and checks deleting posts associated with user" do
    post1 = FactoryGirl.create(:post)
    post1.user.destroy
    post1.user.posts.empty?.should == true
  end

  it "Deletes user and checks deleting comments associated with user" do
    comment1 = FactoryGirl.create(:comment)
    comment1.user.destroy
    comment1.user.comments.empty?.should == true
  end

end