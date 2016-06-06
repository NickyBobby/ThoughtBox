require "rails_helper"

RSpec.feature "logged in user can add new links" do
  context "logged in user sees form for new link" do
    scenario "logged in user sees newly submitted link" do
      user = create(:user)
      login(user)

      expect(page).to have_content "Sign Out"
      expect(page).to have_content "Welcome, Nick"

      fill_in "Title", with: "Google"
      fill_in "Url", with: "http://www.google.com"
      click_on "Add Link"

      save_and_open_page
      expect(page).to have_content "Google"

    end
  end
end
