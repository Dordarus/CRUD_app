require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "GET /pages" do
    it "works!" do
      visit root_path
      expect(page).to have_http_status(200)
    end
  end

  describe "GET /pages/login" do
    it "works!" do
      visit sign_in_path
      expect(page).to have_http_status(200)
    end
  end

  describe "GET /pages/sign_in" do
    it "works!" do
      visit login_path
      expect(page).to have_http_status(200)
    end
  end
end
