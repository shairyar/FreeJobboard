require 'rails_helper'

RSpec.describe "jobs/show", type: :view do
  before(:each) do
    @job = assign(:job, Job.create!(
      :title => "Title",
      :description => "MyText",
      :company => "Company",
      :belongs_to => "Belongs To"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Company/)
    expect(rendered).to match(/Belongs To/)
  end
end
