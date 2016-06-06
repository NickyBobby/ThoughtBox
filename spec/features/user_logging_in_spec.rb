require 'rails_helper'

RSpec.feature "visitor can sign up" do
  context "visitor enters in private information" do
    scenario "logged in user sees homepage" do
      visit "/"
      expect(page).to have_content "Log In or Sign Up"
      click_link "Log In or Sign Up"
      expect(page).to have_content "New User?"
      click_link "Sign Up"

      fill_in "First name", with: "Nick"
      fill_in "Last name", with: "D"
      fill_in "Email", with: "bdiddybreeze@yahoo.com"
      fill_in "Password", with: "Funzies"
      fill_in "Password confirmation", with: "Funzies"
      click_button "Sign Up"

      expect(page).to have_content "Welcome, Nick"
    end
  end
end
