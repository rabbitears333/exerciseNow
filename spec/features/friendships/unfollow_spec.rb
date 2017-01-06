require "rails_helper"

RSpec.feature "Unfollow friend" do
    before do
        @john = User.create!(email: "john@example.com", 
            first_name: "john", last_name: "Doe", password: "password")
        @sarah = User.create(first_name: "sarah", last_name: "Anderson",
                            email: "sarah@example.com", password: "password")
        login_as(@john)
        
        @following = Friendship.create(user: @john, friend: @sarah)
        
        
    end
    scenario "shows friends workout for last 7 days" do
        visit "/"
        click_link "My Lounge"
        link = "a[href='/friendships/#{@following.id}'][data-method='delete']"
        find(link).click
        expect(page).to have_link(@sarah.full_name + "unfollowed")
       
    end
end