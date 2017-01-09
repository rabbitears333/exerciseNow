require "rails_helper"

RSpec.feature "Users sign up" do
    before do
        @john = User.create!(email: "john@example.com", 
            first_name: "john", last_name: "Doe", password: "password")
        @sarah = User.create!(first_name: "sarah", last_name: "Anderson",
                            email: "sarah@example.com", password: "password")
        @henry = User.create!(first_name: "Henry", last_name: "Anderson",
                            email: "henry@example.com", password: "password")
        login_as(@john)
        
        Friendship.create(user: @sarah, friend: @john)
        Friendship.create(user: @henry, friend: @john)
                                
        
    end
    scenario "to followers shows in chatroom windows" do
        visit "/"
        click_link "My Lounge"
        expect(page).to have_content(@room_name)
        
        fill_in "message-field", with: "Hello"
        click_button "Post"
        
        expect(page).to have_content("Hello")
        
        within("#followers") do
            expect(page).to have_link(@sarah.full_name)
            expect(page).to have_link(@henry.full_name)
        end
    end
end