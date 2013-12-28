require 'spec_helper'

describe User do

  it "Checks association user with post" do
    user1 = create(:user)
    post1 = create(:post)
    user1.posts << post1
    user1.id.should == post1.user_id
  end

  it "Deleting user" do
    user1 = create(:user)
    post1 = create(:post)
    post2 = create(:post)
    post3 = create(:post)
    user1.posts << post1
    user1.posts << post2
    user1.posts << post3
    puts user1.posts.count
    user1.destroy
    puts user1
    # expect { delete user_path(user1) }
  end
end