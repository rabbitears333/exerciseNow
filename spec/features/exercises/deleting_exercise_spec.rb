require "rails_helper"
RSpec.feature "Deleting exercises page" do
    before do
        @owner = User.create!(email: "john@example.com", password: "password")
        @owner_exercise = @owner.exercises.create!(duration_in_min:30, 
                                                    workout:'My workout',
                                                    workout_date: Date.today)
        login_as(@owner)
    end
    
    scenario do
        visit "/"
        click_link "My Lounge"
        path = "/users/#{@owner.id}/exercises/#{@owner_exercise.id}"
        link = "a[contains(@href,\'#{path}\') and .//text()='Destroy']"
        find(link).click
        
        find(:path, link).click
        
        expect(page).to have_content("Exercise deleted")
       


    end
end