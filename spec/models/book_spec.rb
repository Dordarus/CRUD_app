require 'rails_helper'

RSpec.describe Book, type: :model do
    before do
        @author = Author.new(first_name: "George", last_name: "Orwell", bio: "An English novelist, essayist, journalist, and critic.")
        @book = Book.new( title: "Some book", genre: "some genre", year: 1234, plot: "Some plot", author: @author)
    end

    subject{@book}

    describe "when title is not present" do
        before{@book.title = "" }
        it {should_not be_valid}
    end

    describe "when genre is not present" do
        before{@book.genre = "" }
        it {should_not be_valid}
    end

    describe "when year is not present" do
        before {@book.year = nil}
        it {should_not be_valid}
    end

    describe "when year is negative number" do
       before {@book.year = -1}
       it {should_not be_valid}
    end

    describe "when year is to big" do
        before {@book.year = 10000}
        it {should_not be_valid}
    end

    describe "when year is not integer value" do
       before{@book.year = 0.5}
       it{should_not be_valid}
    end

    describe "when plot is not present" do
        before{@book.plot = ""}
        it {should_not be_valid}
    end

    describe "when author is not present" do
        it {should be_valid}
    end

    describe "when title to long" do
        before{@book.title = "a"*31}
        it{should_not be_valid}
    end

    describe "when genre to long" do
        before{@book.genre = "a"*31}
        it{should_not be_valid}
    end

    describe "when plot to long" do
        before{@book.plot = "a"*256}
        it{should_not be_valid}
    end

    describe "when book already exist" do
        before do
            same_book = @book.dup
            same_book.title = @book.title.upcase
            same_book.author = @author
            same_book.save
        end

        it{should_not be_valid}
    end
end