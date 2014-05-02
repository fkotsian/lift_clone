require 'spec_helper'

feature "the signup process" do

  it "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Sign Up"
  end


  feature "signing up a user" do

    it "shows the username on the home page after signup" do
      signup_as_jeff
      expect(page).to have_content "Jeff"
    end
  end

end

feature "logging in" do
  before(:each) { signup_as_jeff }
  before(:each) { login_as_jeff }

  it "shows username on the home page after login" do
    expect(page).to have_content "Jeff"
  end

end

feature "logging out" do
  before(:each) { signup_as_jeff }

  it "begins with logged out state" do
    visit root_url
    expect(page).to have_content "Sign In"
  end

  it "doesn't show the username on the home page after logout" do
    login_as_jeff
    logout
    expect(page).to_not have_content "Jeff"
  end

end