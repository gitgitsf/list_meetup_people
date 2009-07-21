require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/job_titles/index.html.erb" do
  include JobTitlesHelper

  before(:each) do
    assigns[:job_titles] = [
      stub_model(JobTitle,
        :title => "value for title"
      ),
      stub_model(JobTitle,
        :title => "value for title"
      )
    ]
  end

  it "renders a list of job_titles" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
  end
end
