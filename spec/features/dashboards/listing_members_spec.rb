require "rails_helper";
RSpec.feature "Deleting exercises page" do
    before do
        @john = User.create(first_name: "John",
                            last_name: "Doe",
                            email: "john@example.com", 
                            password: "password")
        @sarah = User.create(first_name: "Sarah",
                            last_name: "Lee",
                            email: "sarah@example.com", 
                            password: "password")
        @owner_exercise = @john.exercises.create!(duration_in_min:30, 
                                                    workout:'My workout',
                                                    workout_date: Date.today)
        login_as(@owner)
    end
    scenario "show a list of members" do
        visit "/"
        
        

        expect(page).to have_content("List of members")
        expect(page).to have_content(@john.full_name)
        expect(page).to have_content(@sarah.full_name)



    end
end