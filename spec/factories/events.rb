FactoryGirl.define do
  factory :event do
    name "MyString"
		description "MyText"
		date Date.today
		address "MyString"
		city "MyString"
		state "MyString"
		zipcode "MyString"
		user_id 1
  end
end
