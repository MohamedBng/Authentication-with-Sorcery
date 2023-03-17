require 'rails_helper'

RSpec.describe UserSessionsController, type: :controller do
    let(:name) { "simple name" }
    let(:user) { create(:user, password: "1234", password_confirmation: "1234") }
    let(:valid_attributes) do
        { email: user.email , password: "1234"}
    end
    let(:invalid_attributes) do
        { email: user.email, password: "12345"}
    end
    describe "POST create" do
        let(:valid_params) { valid_attributes }
        let(:invalid_params) { invalid_attributes }
        context "with valid params" do
            before do
                post :create, params: valid_params
            end

            it "redirects to dashboard_path" do
                p current_user
                expect(response).to redirect_to(dashboard_path)
            end 
        end
        context "with invalid params" do
            before do
                post :create, params: invalid_params
            end  
    
            it "redirects to new" do
                expect(response).to redirect_to(:login)
            end
        end
    end
    describe "POST destroy" do
        before do
            post :destroy
        end

        it "redirects to root_path" do
            expect(response).to redirect_to(login_path)
        end 
    end
end
