FactoryGirl.define do
	factory :user1,class: User do
		username 'noejean'
		email  'noejean.caramilli@gmail.com' 
		password '12345'
		password_confirmation { |u| u.password }
	end 

	factory :user2,class: User do
		username 'yannik'
		email  'yannik.legoc@gmail.com' 
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