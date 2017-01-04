require "rails_helper"

RSpec.feature "Users sign out" do
    before do
        @john = User.create!(email: "john@example.com",first_name: "john", last_name: "Doe", 
            password:"password")
         visit "/"
        click_link "Sign in"
        fill_in "Email", with: @john.email
        fill_in "Password", with: @john.password
        click_button "Log In"
    end
    scenario do
        visit "/"
        click_link "Sign out"
        expect(page).to have_content("You have signed out for account")
    end
end