require 'rails_helper'

RSpec.describe "Authors", type: :request do

  describe "GET /authors" do
    it "works! (now write some real specs)" do
      visit authors_index_path
      expect(page).to have_http_status(200)
    end
  end

  describe "GET /authors" do
    it "should have the content 'Author'" do
      visit authors_index_path
      expect(page).to have_content("Author")
    end
  end

end
