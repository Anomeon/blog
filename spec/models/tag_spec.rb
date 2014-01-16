require 'spec_helper'

describe Tag do

  it "Deletes tag and checks deleting associations with post in Category" do
    category1 = FactoryGirl.create(:posts_tags_assignment)
    category1.tag.posts.any?.should == true
    category1.tag.destroy
    category1.tag.posts.empty?.should == true
  end

end