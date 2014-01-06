require 'spec_helper'

describe Post do

  it "Checks association post with comment" do
    user1 = create(:user)
    post1 = create(:post)
    comment1 = create(:comment)    
    user1.comments.empty?.should == true
    post1.comments.empty?.should == true
    user1.comments << comment1
    post1.comments << comment1
    user1.comments.first.id.should == comment1.id
    post1.comments.first.id.should == comment1.id
  end

  it "Checks association post with tag" do
    post1 = create(:post)
    tag1 = create(:tag)
    tag1.posts.empty?.should == true
    tag1.posts << post1
    category1 = Category.first
    tag1.posts.first.id.should == category1.post_id
    post1.tags.first.id.should == category1.tag_id
  end

  it "Deletes post and checks deleting comments associated with post" do
    post1 = create(:post)
    comment1 = create(:comment)
    post1.comments.empty?.should == true
    post1.comments << comment1
    post1.destroy
    post1.comments.empty?.should == true
  end

  it "Deletes post and checks deleting associations with tags in Category " do
    post1 = create(:post)
    tag1 = create(:tag)
    tag1.posts.empty?.should == true
    tag1.posts << post1 
    Category.count.should == 1
    post1.destroy
    Category.count.should == 0
  end
end