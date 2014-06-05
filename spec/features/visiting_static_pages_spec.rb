require "rails_helper"

describe "visiting static pages", type: :feature do
  describe "visiting home page" do
    it "receives a 200 status" do
      visit root_path
      page.has_content?("This is the home page")
    end
  end
end
