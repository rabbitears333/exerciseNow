require "rails_helper";
RSpec.feature "Deleting exercises page" do
    before do
        @john = User.create!(first_name: "John",
                            last_name: "Doe",
                            email: "john@example.com", 
                            password: "password")
        @sarah = User.create!(first_name: "Sarah",
                            last_name: "Doe",
                            email: "sarah@example.com", 
                            password: "password")
        
    end
    scenario "show a list of users with name" do
        visit "/"
        
        fill_in "search_name", with: "Doe"
        click_button "Search"

        expect(page).to have_content(@john.full_name)
        expect(page).to have_content(@sarah.full_name)
        expect(current_path).to eq("/dashboards/search")


    end
end