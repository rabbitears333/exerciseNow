require "rails_helper"

RSpec.feature "Listing exercises" do
    before do
        @john = User.create!(email: "john@example.com", 
            first_name: "john", last_name: "Doe", password: "password")
        login_as(@john)
        @e1 = @john.exercises.create(duration_in_min: 20, 
                                    workout: "My activity",
                                    workout_date: Date.today)
        @e2 = @john.exercises.create(duration_in_min: 50, 
                                    workout: "My lifting",
                                    workout_date: 2.days.ago)
        @e3 = @john.exercises.create(duration_in_min: 35, 
                                    workout: "My running",
                                    workout_date: 8.days.ago)
        
    end
    scenario "with invalid credentials" do
        visit "/"
        click_link "My lounge"
        
        expect(page).to have_content(@e1.duration_in_min)
        expect(page).to have_content(@e1.workout)
        expect(page).to have_content(@e1.workout_date)
        
        expect(page).to have_content(@e2.duration_in_min)
        expect(page).to have_content(@e2.workout)
        expect(page).to have_content(@e2.workout_date)
        
        expect(page).to have_content(@e3.duration_in_min)
        expect(page).to have_content(@e3.workout)
        expect(page).to have_content(@e3.workout_date)
    end
    scenario "show no exercises if none are created" do
        @john.exercises.delete_all
        visit '/'
        click_link "My lounge"
        expect(page).to have_content('No workouts')
    end
end