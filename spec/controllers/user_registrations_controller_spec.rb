require 'rails_helper'

RSpec.describe UserRegistrationsController, type: :controller do
    let(:name) { "simple name" }
    let(:object_klass) { User }
    let(:valid_attributes) do
        { email: "John@outlook.fr", password: "1234", password_confirmation: "1234" }
    end
    let(:invalid_attributes) do
        { email: "", password: "1234", password_confirmation: "1234" }
    end
    describe "POST create" do
        let(:object_name) { object_klass.model_name.singular.to_sym }
        let(:valid_params) { { object_name => valid_attributes } }
        let(:invalid_params) { { object_name => invalid_attributes } }
        context "with valid params" do
            it "creates a new object" do
                expect do
                  post :create, params: valid_params
                end.to change(object_klass, :count).by(1)
            end   
    
            it "redirects to the index" do
                post :create, params: valid_params
                expect(response).to redirect_to(dashboard_path)
            end
        end
        context "with invalid params" do
            it "dont creates a new object" do
                expect do
                  post :create, params: invalid_params
                end.to change(object_klass, :count).by(0)
            end   
    
            it "redirects to new" do
                post :create, params: invalid_params
                expect(response).to redirect_to(register_path)
            end
        end
    end
end
