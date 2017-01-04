require "rails_helper"
RSpec.feature "Editing exercises page" do
    before do
        @owner = User.create!(email: "john@example.com", password: "password")
        @owner_exercise = @owner.exercises.create!(duration_in_min:30, 
                                                    workout:'My workout',
                                                    workout_date: Date.today)
        login_as(@owner)
    end
    
    scenario "with valid data" do
        visit "/"
        click_link "My Lounge"
        path = "/users/#{@owner.id}/exercises/#{@owner_exercise.id}/edit"
        link = "a[href=\'#{path}\']"
        find(link).click
        
        fill_in "Duration", with:45
        click_button "Update Exercise"
        
        expect(page).to have_content("Exercise updated")
        expect(page).to have_content(45)
        expect(page).not_to have_content(48)


    end
end