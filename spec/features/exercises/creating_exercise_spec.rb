require "rails_helper"

RSpec.feature "Creating exercises page" do
    before do
        @john = User.create!(email: "john@example.com", password: "password")
        login_as(@john)
    end
    scenario "with valid user credentials" do
        visit "/"
        
        click_link "My Lounge"
        click_link "New Workout"
        expect(page).to have_link("Back")
        
        fill_in "Duration", with: 60
        fill_in "Workout Details", with: "Weight Lifting"
        fill_in "Activity", with: "07/23/2016"
        click_button "Create the exercise"
        
        expect(page).to have_content("Exercise was created successfully")
        exercise = Exercise.last
        expect(current_path).to eq(user_exercise_path(@john, exercise))
        expect(exercise.user_id).to eq(@john.id)
    end
end