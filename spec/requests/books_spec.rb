require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "GET /new/1" do
    it "should have the content 'Create new book'" do
      visit new_book_path(1)
      expect(page).to have_content("Create new book")
    end
  end
end
