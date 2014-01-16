require 'spec_helper'

describe Post do

  describe "Tests for association with comments" do

    it "Checks association post with comment" do
      comment1 = FactoryGirl.create(:comment)
      comment1.user.comments.any?.should == true
      comment1.post.comments.any?.should == true
    end

    it "Deletes post and checks deleting comments associated with post" do
      comment1 = FactoryGirl.create(:comment)
      comment1.user.comments.any?.should == true
      comment1.post.destroy
      comment1.post.comments.empty?.should == true
    end

  end

  describe "Tests for association with tags" do

    it "Checks association post with tag" do
      category1 = FactoryGirl.create(:posts_tags_assignment) 
      category1.tag.posts.any?.should == true
      category1.post.tags.any?.should == true
    end

    it "Deletes post and checks deleting associations with tags in PostsTagsAssignment " do
      category1 = FactoryGirl.create(:posts_tags_assignment)
      category1.post.tags.any?.should == true
      category1.post.destroy
      category1.post.tags.empty?.should == true
    end
  
  end

end