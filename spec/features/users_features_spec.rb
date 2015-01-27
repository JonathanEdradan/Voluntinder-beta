require 'rails_helper'

# 'feature' same as 'describe', just an alias using capybara
feature 'Managing users', type: :feature do
	# let/given allows us to use FactoryGirl throughout our code/tests
	given(:user) { FactoryGirl.create(:user) }
  # let(:user) { FactoryGirl.create(:user) }

	# same as 'it' but in capybara we use 'scenerio' - (BDD User story)
	scenario 'creating a new user' do
		visit '/users/sign_up' # testing user's perspective - "how do users get to signin page"

		fill_in 'user_first_name', with: 'Jonathan' 
		fill_in 'user_last_name', with: 'Edradan'
		fill_in 'user_address', with: '4 Norwood' 
		fill_in 'user_city', with: 'Daly City'
		fill_in 'user_state', with: 'CA' 
		fill_in 'user_zipcode', with: '94015'
		fill_in 'user_email', with: 'j@gmail.com'
		fill_in 'user_password', with: 'password' 
		fill_in 'user_password_confirmation', with: 'password' 

		click_button 'Sign up'

		expect(page).to have_content 'Welcome! You have signed up successfully.'

	  # save_and_open_page # 'launchy allows us to use this method'.  launchy saves and opens a new page with our test parameters.
	end

	scenario 'updating a user' do
		visit "/users/edit"

    fill_in 'user_first_name', with: 'My new name'

    click_button 'Update'

    expect(page).to have_content 'My new name'
	end
end

# 	scenario 'adding a category to a recipe' do
# 		# Since we are using FactoryGirl (let/given) we don't need line 26.
# 		# recipe = Recipe.create(title: 'something', instructions: 'something')

# 		# we place a '#{recipe.id}' in the path instead of ':id' because we are testing. 
# 		visit "/recipes/#{recipe.id}/edit" # Have to use double quotes for rails to interpret Ruby code.

# 		fill_in 'Category', with: 'Burgers'

# 		click_button 'Save'

# 		within('.recipe_category') do
# 			expect(page).to have_content 'Burgers'
# 		end 
# 	end

# 	scenario 'showing a recipe' do
# 		visit "/recipes/#{recipe.id}"

# 		expect(page).to have_content recipe.title
# 		expect(page).to have_content recipe.instructions
# 	end

# 	scenario 'updating a recipe' do
# 		visit "/recipes/#{recipe.id}/edit"

#     fill_in 'Instructions', with: 'Dump in garbage'

#     click_button 'Save'

#     expect(page).to have_content 'Dump in garbage'
# 		expect(page).not_to have_content recipe.instructions # 'recipe.instructions' is the old data that FactoryGirl did not create.
# 	end

# 	scenario 'deleting a recipe' do
#     visit "/recipes/#{recipe.id}"

#     click_link 'Delete'

#     expect {
#     	visit "recipes/#{recipe.id}"
#     }.to raise_error ActiveRecord::RecordNotFound
# 	end
# end