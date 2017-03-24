require 'rails_helper'

RSpec.feature "AuthenticateWithEmails", type: :feature do
  context "Have a working Devise login/sign up system" do
    Steps "I can sign up using a password and an email address" do
      Given "I am on the login page" do
        visit '/users/sign_in'
        expect(page).to have_content("Log in")
      end
      When "I sign up with a new email address and password" do
        click_link 'Sign up'
        fill_in "user_email", with: "testemail@yahoo.com"
        fill_in "user_password", with: "Password"
        fill_in "user_password_confirmation", with: "Password"
        click_button "Sign up"
      end
      Then "I am taken to the apartments index page" do
        expect(page).to have_content("The Apartment App")
      end
    end
  end

  #What we need to do:
  #Go to the login page
  #Do we have a user to sign in with? NO, because the Database is reset each test
    #So, we need to Sign Up
    #We need to create a new user
  #Once we've done that we need to sign Out
  #Then we need to log back in
  #Then we need to check the page

  context "Have a working Devise login/sign up system." do
    Steps "As a user I can sign in using a password and an email address." do
      Given "I am on the login page" do
        visit '/users/sign_in'
        expect(page).to have_content("Log in")
      end
      When "I sign in with a new email address and password" do
        click_link 'Sign up'
        fill_in "user_email", with: "testemail@yahoo.com"
        fill_in "user_password", with: "Password"
        fill_in "user_password_confirmation", with: "Password"
        click_button "Sign up"
        click_link "Sign Out"
        visit '/users/sign_in'
        fill_in "user_email", with: "testemail@yahoo.com"
        fill_in "user_password", with: "Password"
        click_button 'Log in'
      end
      Then "I am taken to the apartments index page" do
        expect(page).to have_content("Signed in successfully.")
      end
    end
  end

  context "As a user, after logging in I can see a greeting and my email at the top of the page" do
    Steps "See above" do
      Given "I am on the login page" do
        visit '/users/sign_in'
        expect(page).to have_content("Log in")
      end
      When "I sign in with a new email address and password" do
        click_link 'Sign up'
        fill_in "user_email", with: "testemail@yahoo.com"
        fill_in "user_password", with: "Password"
        fill_in "user_password_confirmation", with: "Password"
        click_button "Sign up"
        click_link "Sign Out"
        visit '/users/sign_in'
        fill_in "user_email", with: "testemail@yahoo.com"
        fill_in "user_password", with: "Password"
        click_button 'Log in'
      end
      Then "I am taken to the apartments index page" do
        expect(page).to have_content("Hi testemail@yahoo.com! Welcome back.")
      end
    end
  end

  context "As a user who has not signed in,  I can see a listing and individual apartments, but I cannot create, edit or delete an apartment." do
    Steps "See above" do
      Given "I have signed up" do
        visit '/'
        click_link 'Sign In'
        expect(page).to have_content("Log in")
        click_link 'Sign up'
        fill_in "user_email", with: "testemail@yahoo.com"
        fill_in "user_password", with: "Password"
        fill_in "user_password_confirmation", with: "Password"
        click_button "Sign up"
      end
      And "I have created an apartment" do
        click_link 'Create Apartment'
        expect(page).to have_content("New Apartment")
        fill_in "apartment_name", with:"Test Apartment"
        attach_file('apartment[image]', '/Users/learn/Downloads/illustration.jpg')
        click_button 'Create Apartment'
      end
      And "I have signed out" do
        click_link 'Sign Out'
        expect(page).to have_content("Signed out successfully.")
      end
      When "I am on the apartments list page" do
        expect(page).to have_content("The Apartment App")
      end
      And "I am not signed in" do
        expect(page).to have_content("Sign In")
      end
      Then "I can view an apartment show page" do
        click_link "Show"
        expect(page).to have_content("Test Apartment")
      end
      And "I cannot create a new apartment" do
        visit '/'
        expect(page).to_not have_content("Create Apartment")
      end
      And "I cannot edit an apartment" do
        expect(page).to_not have_content("Edit")
      end
      And "I cannot destroy an apartment" do
          expect(page).to_not have_content("Destroy")
      end
    end
  end

  context "As a signed in user, I can create, edit, or delete any apartment" do
    Steps "See above" do
      Given "I have signed up" do
        visit '/'
        click_link 'Sign In'
        expect(page).to have_content("Log in")
        click_link 'Sign up'
        fill_in "user_email", with: "testemail@yahoo.com"
        fill_in "user_password", with: "Password"
        fill_in "user_password_confirmation", with: "Password"
        click_button "Sign up"
      end
      And "I have created an apartment" do
        click_link 'Create Apartment'
        expect(page).to have_content("New Apartment")
        fill_in "apartment_name", with:"Test Apartment"
        attach_file('apartment[image]', '/Users/learn/Downloads/illustration.jpg')
        click_button 'Create Apartment'
      end
      When "I am on the apartment listings page" do
        visit '/'
        expect(page).to have_content("The Apartment App")
      end
      Then "I can create an apartment" do
        click_link 'Create Apartment'
        expect(page).to have_content("New Apartment")
      end
      And "I can edit an apartment" do
        visit '/'
        click_link 'Edit'
        expect(page).to have_content("Editing Apartment")
      end
      And "I can destroy an apartment" do
        visit '/'
        click_link 'Destroy'
        expect(page).to_not have_content("Test Apartment")
      end
    end
  end

  context "As a signed in user, I can only edit or destroy apartments that I create" do
    Steps "Eventually, awesome things will happen" do

    end

  end
end
