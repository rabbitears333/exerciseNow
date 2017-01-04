require "rails_helper"

RSpec.feature "Users sign up" do
    scenario "with valid user credentials" do
        visit "/"
        click_link "Sign up"
        fill_in "First name", with: "John"
        fill_in "Last name", with: "Doe"
        fill_in "Email", "john@example.com"
        fill_in "Password", with: "password"
        fill_in "Password Confirmation", with: "password"
        click_button "Sign up"
        expect(page).to have_content("You have signed up for account")
        
        visit "/"
        expect(page).to have_content("John Doe")
    end
end