require 'rails_helper'

RSpec.describe "Authors", type: :request do

  subject { page }

  describe "GET /authors" do
    before { visit root_path }
    it {should have_http_status(200)} 
    it {should have_content("Authors")} 
  end
end
