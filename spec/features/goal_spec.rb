require 'spec_helper'

feature "Goal" do

  scenario "sign up and navigate to root page" do

    visit new_session_url
    fill_in "Username", with: "Jeff"
    fill_in "Password", with: "password"
    click_button 'Log In'

    expect(page).to have_content "Jeff"

  end

  before (:each) { signup_as_jeff }

  # making a goal
  context "creating a goal" do

    before :each do
      click_link "Create New Goal"
    end

    scenario "goal form is available" do
      expect(page).to have_content "New Goal"
    end

    scenario "has title field" do
      expect(page).to have_content "Goal Title"
    end

    scenario "has description field" do
      expect(page).to have_content "Goal Description"
    end

    scenario "has private/public status buttons" do
      expect(page).to have_content "Private"
      expect(page).to have_content "Public"
    end

    scenario "can create a goal" do
      fill_in "Goal Title", with: "Win at App Academy"
      fill_in "Goal Description", with: "Win at AA Assessments"
      choose('Public')
      click_button("Create Goal")
      expect(page).to have_content "Win at App Academy"
    end
  end

# updating goal
  context "updating a goal" do

    before(:each) do
      create_test_goal
    end
  # start on user show page
    scenario
  # all goals that you own have edit links
  # click to navigate to edit page
  # edit page should have title
  # edit page should have form with correct fields
  # click to update goal
  # redirects back to show page
  # show page should have updated information

# showing a goal
  # on user show page
  # click to navigate to goal show page
  # page should have content goal title
  # goals should be complete/incomplete
  # should see all own goals
  # other user
    # shouldn't be able to see private goals;
    # other user should be able to see public goals
  # should have button to complete goal

# destroying a goal
  # on user show page
  # should have button to remove goal
  # when clicked, should navigate to user show page
  # should have not content title of goal



end