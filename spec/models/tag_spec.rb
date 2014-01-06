require 'spec_helper'

describe Tag do

  it "Deletes tag and checks deleting associations with post in Category" do
    post1 = create(:post)
    tag1 = create(:tag)
    tag1.posts.empty?.should == true
    tag1.posts << post1 
    Category.count.should == 1
    tag1.destroy
    Category.count.should == 0
  end

end