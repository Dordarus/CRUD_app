require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryBot.create(:user) }
    before { visit user_path(user) }
    
    it { should have_title(user.name) }
    it { should have_content(user.name) }
  end
end

