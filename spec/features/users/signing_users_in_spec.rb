require "rails_helper"

RSpec.feature "Users sign up" do
    before do
        @john = User.create!(email: "john@example.com", password: "password")
    end
    scenario "with valid user credentials" do
        visit "/"
        click_link "Sign In"
        fill_in "Email", @john.email
        fill_in "Password", with: @john.password
        click_button "Log in"
        expect(page).to have_content("You have signed in for account")
        expect(page).to have_content("Signed in as #{@john.email}")
    end
end