require 'rails_helper'

RSpec.describe Author, type: :model do
    before do
        @author = Author.new(first_name: "George", last_name: "Orwell", bio: "An English novelist, essayist, journalist, and critic.")
        @book = Book.new( title: "Some book", genre: "some genre", year: 1234, plot: "Some plot", author_id: @author.id)
    end

    subject{@author}

    describe "when firs_name is not present" do
        before{@author.first_name = ""}
        it {should_not be_valid}
    end

    describe "when last_name is not present" do
        before{@author.last_name = ""}
        it {should_not be_valid}
    end

    describe "when bio is not present" do
        before{@author.bio = ""}
        it {should_not be_valid}
    end

    describe "when firs_name to long" do
        before{@author.first_name = "a"*11}
        it{should_not be_valid}
    end

    describe "when last_name to long" do
        before{@author.first_name = "a"*11}
        it{should_not be_valid}
    end

    describe "when bio to long" do
        before{@author.first_name = "a"*256}
        it{should_not be_valid}
    end

    describe "when author alredy exist" do
        before do
            author_with_same_name = @author.dup
            author_with_same_name.first_name = @author.first_name.upcase
            author_with_same_name.last_name = @author.last_name.downcase
            author_with_same_name.save
        end

        it{should_not be_valid}
    end

    describe "when author not exist" do
        before do
            author_with_same_name = @author.dup
            author_with_same_name.first_name = @author.first_name.upcase
            author_with_same_name.last_name = "another last name"
            author_with_same_name.save
        end

        it{should be_valid}
    end

end