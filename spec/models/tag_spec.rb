require 'spec_helper'

describe Tag do

  it "Deletes tag and checks deleting associations with post in Category" do
    tag1 = FactoryGirl.reate(:tag)
    post1 = FactoryGirl.create(:post)
    tag1 = FactoryGirl.create(:tag)
    tag1.posts.empty?.should == true
    tag1.posts << post1 
    Category.count.should == 1
    tag1.destroy
    Category.count.should == 0
  end

end