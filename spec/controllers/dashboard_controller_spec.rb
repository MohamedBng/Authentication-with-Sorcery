require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
    let(:name) { "simple name" }
    describe "GET /show" do
        context "as guest" do
            before do
                get "show"
            end
            it "redirect to the login page" do
                expect(response).to redirect_to login_path
            end
        end
    end
end
