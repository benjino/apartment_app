require 'rails_helper'

#Imagine Capybara is a human who has never used a computer before and you have to tell them EXPLICITLY everything you want to do

#Also these tests DO NOT talk to the _development database, they talk to the _test database, which is completely cleared after each test

# RSpec.feature "TextacularSearches", type: :feature do
#   context "Creating different search queries with Textacular" do
#     Steps "We can search an apartment by address" do
#       Given "we are on the index page and we create a new apartment" do
#         visit '/' #basically go to the root url, i.e. localhost:3000
#         click_link 'Create Apartment' #click the link on the page that has the words 'List Apartment' in it
#         #on clicking 'List Apartment', we got to the apartments/new page
#       end
#       When "We create a new apartment with an address at '123 Lane'" do
#         fill_in "apartment_street1", with: "123 Lane" #find the field on the /apartments/new page that has the id 'apartment_street1'
#         attach_file('apartment[image]', '/Users/learn/Downloads/illustration.jpg') #attach the file to the field that has the new 'apartment[image]'
#         click_button "Create Apartment" #click the button, which will take you to /apartments/:id/show
#         visit '/' #visit the index, since the button above took us to the show page and in this test we are testing the functionality of the search on the index page
#       end
#       Then "We can search for it" do
#         fill_in "search", with: "Lane" #fill in the field named "search" with "Lane"
#         click_button "Search" #click the button, which calls the 'index' method in our ApartmentsController
#         expect(page).to have_content("Lane") #expect the page to display the apartment we just made, since we just searched for it
#       end
#     end
#   end
#   context "Creating a search by description with Textacular" do
#     Steps "We can search an apartment by description" do
#       Given "We are on the index page and perform a search by description" do
#         visit '/'
#         click_link 'Create Apartment'
#       end
#       When "We create a new apartment with a description" do
#         fill_in "apartment_description", with: "My great description"
#         attach_file('apartment[image]', '/Users/learn/Downloads/illustration.jpg')
#         click_button "Create Apartment"
#         visit '/'
#       end
#       Then "We can search for it" do
#         fill_in "search", with: "great"
#         click_button "Search"
#         expect(page).to have_content("great")
#       end
#     end
#   end
#
#   context "Creating a search by description with Textacular" do
#     Steps "We can search an apartment by anything" do
#       Given "We are on the index page and create a new apartment" do
#         visit '/'
#         click_link 'Create Apartment'
#       end
#       When "We create a new apartment with a phone number" do
#         fill_in "apartment_phone_number", with: "858-555-1818"
#         attach_file('apartment[image]', '/Users/learn/Downloads/illustration.jpg')
#         click_button "Create Apartment"
#         visit '/'
#       end
#       Then "We can search for it" do
#         fill_in "search", with: "858"
#         click_button "Search"
#         expect(page).to have_content("858")
#       end
#     end
#   end
# end
