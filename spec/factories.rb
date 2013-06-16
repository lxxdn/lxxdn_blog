FactoryGirl.define do
	factory :user1,class: User do
		username 'lxxdn'
		email  'julien.luxiao@gmail.com' 
		password '12345'
		password_confirmation { |u| u.password }
	end 

	factory :user2,class: User do
		username 'luxiao'
		email  'mail@lxxdn.com' 
		password '12345'
		password_confirmation { |u| u.password }
	end 
end

FactoryGirl.define do
	factory :post do 
		content 'hello world'
		title  'coucou'
		association :author, factory: :user1
	end 
end