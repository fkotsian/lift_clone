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
      click_link "Create New Goal"
      create_test_goal
      click_link "Edit Goal"
    end
  # start on user show page
    scenario "should have an edit form" do
      expect(page).to have_content "Edit Goal"
    end

    scenario "has title field" do
      expect(page).to have_content "Goal Title"
    end

    scenario "has description field" do
      expect(page).to have_content "Goal Description"
    end

    scenario "has fields pre-filled" do
      find_field('Title').value.should eq 'Win at App Academy'
      find_field('Description').value.should eq 'Win at AA Assessments'
    end

    scenario "on a successful update" do
      fill_in 'Title', with: "Really Win at App Academy, super hard!"
      click_button "Update Goal"
      expect(page).to have_content "Home"
      expect(page).to have_content "Really Win at App Academy, super hard!"
    end

  end

  context "showing a goal" do

    before(:each) do
      click_link "Create New Goal"
      create_test_goal
    end

    scenario "should have goal title" do
      expect(page).to have_content 'Win at App Academy'
    end

    scenario "should have goal description" do
      expect(page).to have_content 'Win at AA Assessments'
    end

    context "goals should show completion status" do

      scenario "with an incomplete goal" do
        expect(page).to have_content "Incomplete"
      end

      scenario "with a complete goal" do
        click_button "Complete Goal"
        expect(page).to have_content "Complete"
      end

    end

    scenario "user can see all owned goals" do
      click_link "Back to Home"
      click_link "Create New Goal"
      create_private_goal
      click_link "Back to Home"
      save_and_open_page
      expect(page).to have_content "Win at AA Assessments"
      expect(page).to have_content "Keep it secret"
    end

   end

  context "goals feed" do

    buck = FactoryGirl.create(:buck)
    completed_goal = FactoryGirl.create :completed_goal, user_id: buck.id
    private_goal = FactoryGirl.create :private_goal, user_id: buck.id
    buck_goal = FactoryGirl.create :buck_goal, user_id: buck.id

    before :each do

      # click_link "Create New Goal"
#       create_test_goal
#       click_link "Back to Home"
#       click_link "Create New Goal"
#       create_private_goal
#       logout
#       signup_as_buck
#       click_link "Create New Goal"
#       create_buck_goal

       click_link "Goal Feed"
    end

    scenario "user can see all public goals" do
      save_and_open_page
      expect(page).to have_content "I kick ass"
      expect(page).to have_content "Banana SMOOTOOOOTHIE"
    end

    scenario "user cannot see private goals of other users" do
      expect(page).to_not have_content "Keep it secret"
    end

  end
# destroying a goal
  # on user show page
  # should have button to remove goal
  # when clicked, should navigate to user show page
  # should have not content title of goal

end