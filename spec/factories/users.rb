FactoryGirl.define do
  factory :user do
  	email "test123@example.com"
  	password "password"
  	password_confirmation "password"
    first_name "Bobby"
  	last_name "Bob"
  	address '225 Bush Street'
  	city 'San Francisco'
  	state 'CA'
  	zipcode '94104'
  end

end
