require 'rails_helper'

RSpec.describe Employers::JobsController, type: :controller do


  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # JobsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before(:each) do
    @company = create(:company)
    @job = attributes_for(:job, company: @company)
  end

  describe "GET #index" do
    it "returns a success response" do
      Job.create! @job
      get :index, params: {company_id: @company.id}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      job = Job.create! @job
      get :show, params: {id: job.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end
  #
  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {company_id: @company.id}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      job = Job.create! @job
      get :edit, params: {id: job.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Job" do
        expect {
          post :create, params: {company_id: @company.id, job: @job}, session: valid_session
        }.to change(Job, :count).by(1)
      end

      it "redirects to the created job" do
        post :create, params: {company_id: @company.id, job: @job}, session: valid_session
        expect(response).to redirect_to(employers_job_path(1))
      end
    end

  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        attributes_for(:job)
      }

      it "updates the requested job" do
        job = Job.create! @job
        put :update, params: {id: job.to_param, job: new_attributes}, session: valid_session
        job.reload
        expect(@job[:title]).to eq(job.title)
      end

      it "redirects to the job" do
        job = Job.create! @job
        put :update, params: {id: job.to_param, job: new_attributes}, session: valid_session
        expect(response).to redirect_to(employers_job_path(job.id))
      end
    end

  end

  describe "DELETE #destroy" do
    it "destroys the requested job" do
      job = Job.create! @job
      expect {
        delete :destroy, params: {company_id: @company.id, id: job.to_param}, session: valid_session
      }.to change(Job, :count).by(-1)
    end

    it "redirects to the jobs list" do
      job = Job.create! @job
      delete :destroy, params: {id: job.to_param}, session: valid_session
      expect(response).to redirect_to( employers_company_jobs_path(job.company))
    end
  end

end
