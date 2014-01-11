require 'spec_helper'

describe User do
  it "Checks association user with post" do
    user1 = FactoryGirl.create(:user)
    post1 = FactoryGirl.create(:post)
    user1.posts.empty?.should == true
    user1.posts << post1
    user1.posts.first.id.should == post1.id
  end

  it "Deletes user and checks deleting posts associated with user" do
    user1 = FactoryGirl.create(:user)
    post1 = FactoryGirl.create(:post)
    user1.posts.empty?.should == true
    user1.posts << post1
    # puts user1.posts.count            # Удалить
    user1.destroy                       # Удаляю из базы, но не из памяти? Почему вызвав puts ниже объект еще существует? Может из за того, что я вызываю на нем метод (проверил, объект остается тот же что и при создании, так что вряд ли из за этого), он автоматически создается пустым?
    user1.posts.empty?.should == true
    # puts user1.posts.count            # Удалить
    # puts user1.inspect                # Удалить
  end

  it "Deletes user and checks deleting comments associated with user" do
    user1 = FactoryGirl.create(:user)
    comment1 = FactoryGirl.create(:comment)
    user1.comments.empty?.should == true
    user1.comments << comment1
    user1.destroy
    user1.comments.empty?.should == true
  end

end