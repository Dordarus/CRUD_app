require 'rails_helper'

RSpec.describe "Pages", type: :request do

  let(:user){FactoryBot.build(:user)}

  subject { page }

  describe "GET /pages" do
    before { visit root_path }
    it{should have_http_status(200)}
  end

  describe "GET /sign_up" do
    before { visit sign_up_path }
    it{should have_http_status(200)}
  end

  describe "GET /sign_in" do
    before { visit sign_in_path }
    it{should have_http_status(200)}
  end

  describe "sign_up page" do
    before{ visit sign_up_path }

    let(:submit) {"Create account"}

    describe "with invalid info" do
      it "should not create a user" do
        expect{click_button submit}.not_to change(User, :count)
      end  
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: user.name
        fill_in "Email",        with: user.email
        fill_in "Password",     with: user.password
        fill_in "Confirmation", with: user.password_confirmation
      end

      it "should create a user" do
        expect{click_button submit}.to change(User, :count).by(1)
      end
    end
  end
end
