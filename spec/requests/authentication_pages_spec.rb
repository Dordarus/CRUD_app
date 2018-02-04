require 'rails_helper'

RSpec.describe "Authentication", type: :request do

  subject{ page }

  describe "sign_in page" do
    before { visit sign_in_path }

    it { should have_content('Sign in') }
    it { should have_title('Sign in') }
  end 

  describe "sign_in" do

    before { visit sign_in_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_title('Sign in') }
      it { should have_selector('div.alert.alert-danger') }

      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_selector('div.alert.alert-danger') }
      end
    end
  

    describe "with valid information" do
      let(:user) { FactoryBot.create(:user) }
      before do
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      it { should have_title(user.name) }
      it { should have_link('Profile',     href: user_path(user)) }
      it { should have_link('Sign out',    href: sign_out_path) }
      it { should_not have_link('Sign in', href: sign_in_path) }

      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
      end
    end
  end

  describe "authorization" do

    describe "for non-signed-in users" do
      before do
        @author = Author.create(first_name: "George", last_name: "Orwell", bio: "An English novelist, essayist, journalist, and critic.")
        @book = Book.create( title: "Some book", genre: "some genre", year: 1234, plot: "Some plot", author_id: @author.id)
      end

      let(:user) { FactoryGirl.create(:user) }

      describe "in the Book controller" do

        describe "visiting the edit book page" do
          before { visit edit_book_path(@book) }
          it { should_not have_title('Edit info about book') }
        end

        describe "visiting the new book page" do
          before { visit new_book_path(@book.author.id) }
          it { should_not have_title('Create new book') }
        end

        describe "submitting to the update book action" do
          before { patch book_path(@book) }
          specify { expect(response).to redirect_to(sign_in_path) }
        end

        describe "submitting to the create book action" do
          before { post '/books' }
          specify { expect(response).to redirect_to(sign_in_path) }
        end

        describe "submitting to the destroy book action" do
          before { delete book_path(@book) }
          specify { expect(response).to redirect_to(sign_in_path) }
        end
      end

      describe "in the Author controller" do
        describe "visiting the edit author page" do
          before { visit edit_author_path(@author) }
          it { should_not have_title('Edit info about author') }
        end

        describe "visiting the new author page" do
          before { visit new_author_path(@author) }
          it { should_not have_title('Create new author') }
        end

        describe "submitting to the update author action" do
          before { patch author_path(@author) }
          specify { expect(response).to redirect_to(sign_in_path) }
        end

        describe "submitting to the create author action" do
          before { post '/authors' }
          specify { expect(response).to redirect_to(sign_in_path) }
        end
      end
    end
  end
end
