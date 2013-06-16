require 'spec_helper'

describe Post do

  before(:each) do
  	@post = build(:post)
  end

  describe "#title" do
    it "should not be empty" do
      @post.title = nil
      @post.valid?.should == false
    end

    it "should be longer than 3" do
    	@post.title = 'lu'
    	@post.valid?.should == false

    	@post.title = 'lux'
    	@post.valid?.should == true
    end
  end

  describe "#content" do
    it "should not be empty" do
       @post.content = nil
       @post.valid?.should == false
    end
    it "should be longer than 6" do
      @post.content = 'good'
      @post.valid?.should == false

      @post.content = 'good morning'
      @post.valid?.should == true
    end

  end

  describe "#author" do
    it "should not be empty" do
      @post.author.should_not == nil
    end

    it "should have the same to the user who creates it " do
    	@user1 = build(:user1)
    	@user = User.find_by_username(@user1.username)
    	@user.destroy
      @user = create(:user1)
      @post = @user.posts.build(title: 'test', content: '1122334455')
      @post.author.should == @user
    end

  end

end
