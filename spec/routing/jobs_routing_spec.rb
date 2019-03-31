require "rails_helper"

RSpec.describe Employers::JobsController, type: :routing do
  describe "routing" do
    before(:each) do
      @company = create(:company)
      # binding.pry
    end
    it "routes to #index" do
      expect(:get => employers_company_jobs_path(company_id: @company.id)).to route_to("employers/jobs#index")
    end

    it "routes to #new" do
      expect(:get => "employers/jobs/#{@company.id}/new").to route_to("employers/jobs#new")
    end

    it "routes to #show" do
      expect(:get => "employers/jobs/1").to route_to("employers/jobs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "employers/jobs/1/edit").to route_to("employers/jobs#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "employers/#{@company.id}/jobs").to route_to("employers/jobs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "employers/jobs/1").to route_to("employers/jobs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "employers/jobs/1").to route_to("employers/jobs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "employers/jobs/1").to route_to("employers/jobs#destroy", :id => "1")
    end
  end
end
