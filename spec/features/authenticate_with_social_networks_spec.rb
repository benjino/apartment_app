require 'rails_helper'

RSpec.feature "AuthenticateWithSocialNetworks", type: :feature do
  context "I can sign up with a Twitter account" do
    Steps "See above" do
      Given "I am on the apartment listings page" do
          visit '/'
          expect(page).to have_content("The Apartment App")
      end
      When "I sign up through Twitter" do
        click_link 'Sign Up With Twitter'
      end
    end
  end
end
