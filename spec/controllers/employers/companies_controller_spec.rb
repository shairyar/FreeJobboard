require 'rails_helper'

RSpec.describe Employers::CompaniesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Company. As you add validations to Company, be sure to
  # adjust the attributes here as well.

  let(:valid_attributes) {attributes_for(:company)}

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CompaniesController. Be sure to keep this updated too.
  let(:valid_session) {{}}

  describe "GET #index" do
    it "returns a success response" do
      Company.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      company = Company.create! valid_attributes
      get :show, params: {id: company.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      company = Company.create! valid_attributes
      get :edit, params: {id: company.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Company" do
        expect {
          post :create, params: {company: valid_attributes}, session: valid_session
        }.to change(Company, :count).by(1)
      end

      it "redirects to the created company" do
        post :create, params: {company: valid_attributes}, session: valid_session
        expect(response).to redirect_to(employers_companies_path(Company.last.id))
      end
    end

  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {attributes_for(:company)}

      it "updates the requested company" do
        company = Company.create! valid_attributes
        put :update, params: {id: company.to_param, company: new_attributes}, session: valid_session
        company.reload
        expect(company.name).to eq(new_attributes[:name])
      end

      it "redirects to the company" do
        company = Company.create! valid_attributes
        put :update, params: {id: company.to_param, company: new_attributes}, session: valid_session
        expect(response).to redirect_to(employers_company_path(company.id))
      end
    end
  end

end
