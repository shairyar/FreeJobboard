require 'rails_helper'

RSpec.describe "jobs/index", type: :view do
  before(:each) do
    assign(:jobs, [
      Job.create!(
        :title => "Title",
        :description => "MyText",
        :company => "Company",
        :belongs_to => "Belongs To"
      ),
      Job.create!(
        :title => "Title",
        :description => "MyText",
        :company => "Company",
        :belongs_to => "Belongs To"
      )
    ])
  end

  it "renders a list of jobs" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Company".to_s, :count => 2
    assert_select "tr>td", :text => "Belongs To".to_s, :count => 2
  end
end
