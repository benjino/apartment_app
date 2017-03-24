require 'rails_helper'

# RSpec.feature "ShowMap", type: :feature do
#   context "Landing page" do
#     Steps "Create New Listing" do
#       Given "I create an apartment listing after clicking the link to list an apartment on localhost 3000:" do
#         visit "/apartments/new"
#         fill_in "Name", with: "Joe"
#         fill_in "Phone number", with: "123-456-7890"
#         fill_in "Hours to contact", with: "9am - 5pm"
#         fill_in "Street1", with: "750 J St"
#         fill_in "Street2", with: "Apt 5"
#         fill_in "City", with: "San Diego"
#         fill_in "Postalcode", with: "92101"
#         fill_in "State", with: "CA"
#         fill_in "Country", with: "USA"
#         click_button "Create Apartment"
#       end
#       Then "I see the show page with a map and details of the apartment" do
#         expect(page).to have_content("Apartment was successfully created.");
#         expect(page).to have_content("Joe");
#         expect(page).to have_content("123-456-7890");
#         expect(page).to have_content("9am - 5pm");
#         expect(page).to have_content("750 J St");
#         expect(page).to have_content("Apt 5");
#         expect(page).to have_content("San Diego");
#         expect(page).to have_content("92101");
#         expect(page).to have_content("Postalcode");
#         expect(page).to have_content("CA");
#         # expect(page).not_to have_content("Google Map should be here...")
#       end
#     end
#   end
# end
