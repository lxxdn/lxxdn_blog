require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the SessionHelper. For example:
#
# describe SessionHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe SessionHelper do

	describe "user" do
  	context "when signed in" do

  		before(:each){
				@user = create(:user1)
				sign_in @user
			}
			after(:each) {
				@user.destroy
			}

    	it "should be the same than the current_user " do
      	current_user.should == @user
    	end

    	it "should have the same remember_token than that in cookies" do
    	  cookies[:remember_token].should == @user.remember_token
    	end

    	it "signed_in? returns true" do
    	  signed_in?.should == true
    	end
  	end
  end

  describe "current_user" do

  	before(:each){
  		sign_out
	  }

  	context "when signed out" do
  		it "should be nil" do
      	current_user.should == nil
    	end  
  	end
  end

  describe "remember_token in cookies" do

  	before(:each){
  		sign_out
	  }

    context "when signed out" do
    	it "should be nil" do
      	cookies[:remember_token].should == nil
    	end  
    end
  end

end
