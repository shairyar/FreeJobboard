require "rails_helper"

RSpec.describe Employers::CompaniesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "employers/companies").to route_to("employers/companies#index")
    end

    it "routes to #new" do
      expect(:get => "employers/companies/new").to route_to("employers/companies#new")
    end

    it "routes to #show" do
      expect(:get => "employers/companies/1").to route_to("employers/companies#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "employers/companies/1/edit").to route_to("employers/companies#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "employers/companies").to route_to("employers/companies#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "employers/companies/1").to route_to("employers/companies#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "employers/companies/1").to route_to("employers/companies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "employers/companies/1").to route_to("employers/companies#destroy", :id => "1")
    end
  end
end
