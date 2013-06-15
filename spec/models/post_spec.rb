require 'spec_helper'

describe Post do

  before(:each) do
  	@post = Post.new(title: 'coucou', content: 'foofoofoo') 
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
      user = User.new()
    end

    it "should have the same to the user who creates it " do
      pending
    end

  end

end
