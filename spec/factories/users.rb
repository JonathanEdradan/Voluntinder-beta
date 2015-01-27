FactoryGirl.define do
  factory :user do
  	first_name 						'firstname'
  	last_name 						'lastname'
  	address 							'address'
  	city                  'city'               
  	state                 'state'
  	zipcode               'zipcode'
  	email                 'test@email.com'
  	password              'password'
  	password_confirmation 'password'
  end
end
