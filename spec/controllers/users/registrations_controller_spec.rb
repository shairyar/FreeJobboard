require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do

  before :each do
    request.env['devise.mapping'] = Devise.mappings[:user]
  end
  describe ".create" do
    let(:new_user) {attributes_for(:user)}

    context "when job seeker route is visited" do
      it 'registers a job seeker' do
        post :create, params: {user: new_user}
        registered_job_seeker = User.find_by email: new_user[:email]
        expect(registered_job_seeker.email).to eq(new_user[:email])
      end
    end

    context "when employer route is visited" do
      it 'registers an employer with company' do
        user_with_company = new_user.merge({"companies_attributes" => {"0" => attributes_for(:company)}})
        post :create, params: {user: user_with_company}
        registered_employer = User.find_by email: new_user[:email]
        expect(registered_employer.companies.count).to eq(1)
      end
    end
  end
end
