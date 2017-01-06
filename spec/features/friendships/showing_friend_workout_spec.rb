require "rails_helper"

RSpec.feature "Listing exercises" do
    before do
        @john = User.create!(email: "john@example.com", 
            first_name: "john", last_name: "Doe", password: "password")
        @sarah = User.create(first_name: "sarah", last_name: "Anderson",
                            email: "sarah@example.com", password: "password")
        login_as(@john)
        @e1 = @john.exercises.create(duration_in_min: 20, 
                                    workout: "My activity",
                                    workout_date: Date.today)
        @e2 = @sarah.exercises.create(duration_in_min: 50, 
                                    workout: "My lifting",
                                    workout_date: 2.days.ago)
        @following = Friendship.create(user: @john, friend: @sarah)
        # @e3 = @john.exercises.create(duration_in_min: 35, 
        #                             workout: "My running",
        #                             workout_date: 8.days.ago)
        
    end
    scenario "shows friends workout for last 7 days" do
        visit "/"
        click_link "My Lounge"
        click_link @sarah.full_name
        expect(page).to have_content("My Friends")
        expect(page).to have_link(@sarah.full_name + "'s Exercises")
        expect(page).to have_link(@e2.workout)
        expect(page).to have_css("div#chart")
    end
end