require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "GET /pages" do
    it "should have status 200" do
      visit root_path
      expect(page).to have_http_status(200)
    end
  end

  describe "GET /pages/sign_up" do
    it "should have status 200" do
      visit sign_up_path
      expect(page).to have_http_status(200)
    end
  end

  describe "GET /pages/sign_in" do
    it "should have status 200" do
      visit sign_in_path
      expect(page).to have_http_status(200)
    end
  end
end
