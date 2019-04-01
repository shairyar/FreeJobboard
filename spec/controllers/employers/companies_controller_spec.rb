require 'rails_helper'

RSpec.describe Employers::CompaniesController, type: :controller do
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CompaniesController. Be sure to keep this updated too.
  let(:valid_session) {{}}

  before(:each) do
    @user = create(:user)
    @company = attributes_for(:company)
    sign_in @user
  end

  describe "GET #index" do
    it "returns a success response" do
      create_company
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    context "when user is member of a company" do
      it "returns a success response" do
        company = create_company
        get :show, params: {id: company.to_param}, session: valid_session
        expect(response).to be_successful
      end
    end

    context "when user is not member of a company" do
      it "raises NotAuthorizedError" do
        company = create_company(true)

        expect {
          get :show, params: {id: company.to_param}, session: valid_session
        }.to raise_error(Pundit::NotAuthorizedError)
      end
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do

    context "when user is member of a company" do
      it "returns a success response" do
        company = create_company
        get :edit, params: {id: company.to_param}, session: valid_session
        expect(response).to be_successful
      end
    end

    context "when user is not member of a company" do
      it "raises NotAuthorizedError" do
        company = create_company(true)
        expect {
          get :edit, params: {id: company.to_param}, session: valid_session
        }.to raise_error(Pundit::NotAuthorizedError)
      end
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Company" do
        expect {
          post :create, params: {company: attributes_for(:company)}, session: valid_session
        }.to change(Company, :count).by(1)
      end

      it "redirects to the created company" do
        post :create, params: {company: attributes_for(:company)}, session: valid_session
        expect(response).to redirect_to(employers_companies_path(Company.last.id))
      end
    end

  end

  describe "PUT #update" do
    let(:new_attributes) {attributes_for(:company)}
    context "when user is a member of a company" do

      it "updates the requested company" do
        company = create_company
        put :update, params: {id: company.to_param, company: new_attributes}, session: valid_session
        company.reload
        expect(company.name).to eq(new_attributes[:name])
      end

      it "redirects to the company" do
        company = create_company
        put :update, params: {id: company.to_param, company: new_attributes}, session: valid_session
        expect(response).to redirect_to(employers_company_path(company.id))
      end
    end

    context "when user is not member of a company" do
      it "raises NotAuthorizedError" do
        company = create_company(true)
        expect {
          put :update, params: {id: company.to_param, company: new_attributes}, session: valid_session
        }.to raise_error(Pundit::NotAuthorizedError)
      end

    end

  end
  private
  # when different_user is set to true, it creates a company that logged in user is not associated with
  # @user is a logged in user
  def create_company(different_user = false)

    user = different_user ? create(:user) : @user
    company = Company.new @company
    company.users << user
    company.save!
    company
  end
end
