require 'spec_helper'

describe User do

	before(:each) do 
		#@user = User.new(username: 'luxiao', email: 'julien.luxiao@gmail.com', 
		#	password: "12345", password_confirmation: "12345")
		#@user2 = User.new(username: 'lxxdn', email: 'mail@lxxdn.com', 
		#	password: "12345", password_confirmation: "12345")

		@user1 = build(:user1)
		@user2 = build(:user2)
	
	end 

	describe "#password" do

  		context "when user is created " do 
			it "should be be encoded" do
				@user1.password_digest.length.should_not == "12345".length
			end

			it "password equals to password_confirmation" do
				@user1 = User.new(username: 'luxiao', email: 'julien.luxiao@gmail.com', 
					password: "12345", password_confirmation: "123456")
				@user1.valid?.should == false
			end 
  		end 
  	end 


   	describe "#username" do 
   		context "when user is created" do
  	  		it "should not be empty" do
  	  			@user1.username = nil
  	  			@user1.valid?.should == false
  	  		end 

			it "should be unique" do
				@user1.save
				@user2.username = 'lxxdn'
				@user2.valid?.should == false
			end 
  		end
  	end

  	describe "#email" do
  		context "when user is created" do
  		  it "should be the correct format" do
  		    @user1.email = '12345'
  		    @user1.valid?.should == false
  		    @user1.email = '1122@gg'
  		    @user1.valid?.should == false
  		    @user1.email = 'louther2930@gmail.com'
  		    @user1.valid?.should == true
  		  end

  		  it "should not be empty" do
  		    @user1.email = nil
  		    @user1.valid?.should == false
  		  end

  		  it "should be unique" do
  		    @user1.save
  		    @user2.email = "julien.luxiao@gmail.com"
  		    @user2.valid?.should == false
  		  end
  		end
  	end 

  	context "when deleted" do
  	  
  	  it "should delete all its posts " do
  	  	@user1.save
  	  	10.times do 
  	  		@user1.posts.create(title: 'ttttttt', content: '1234556778889')
  	  	end

  	  	posts = @user1.posts
  	  	posts.length.should == 10

  	  	@user1.destroy
  	  	puts posts.length.should == 0

  	  end
  	  
  	end

end
