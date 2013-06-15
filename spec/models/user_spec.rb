require 'spec_helper'

describe User do

	before(:each) do 
		@user = User.new(username: 'luxiao', email: 'julien.luxiao@gmail.com', 
			password: "12345", password_confirmation: "12345")
		@user2 = User.new(username: 'lxxdn', email: 'mail@lxxdn.com', 
			password: "12345", password_confirmation: "12345")
	end 

	describe "#password" do

  		context "when user is created " do 
			it "should be be encoded" do
				@user.password_digest.length.should_not == "12345".length
			end

			it "password equals to password_confirmation" do
				@user = User.new(username: 'luxiao', email: 'julien.luxiao@gmail.com', 
					password: "12345", password_confirmation: "123456")
				@user.valid?.should == false
			end 
  		end 
  	end 


   	describe "#username" do 
   		context "when user is created" do
  	  		it "should not be empty" do
  	  			@user.username = nil
  	  			@user.valid?.should == false
  	  		end 

			it "should be unique" do
				@user.save
				@user2.username = 'luxiao'
				@user2.valid?.should == false
			end 
  		end
  	end

  	describe "#email" do
  		context "when user is created" do
  		  it "should be the correct format" do
  		    @user.email = '12345'
  		    @user.valid?.should == false
  		    @user.email = '1122@gg'
  		    @user.valid?.should == false
  		    @user.email = 'louther2930@gmail.com'
  		    @user.valid?.should == true
  		  end

  		  it "should not be empty" do
  		    @user.email = nil
  		    @user.valid?.should == false
  		  end

  		  it "should be unique" do
  		    @user.save
  		    @user2.email = "julien.luxiao@gmail.com"
  		    @user2.valid?.should == false
  		  end
  		end


  	end 

end
