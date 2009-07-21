require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/job_titles/show.html.erb" do
  include JobTitlesHelper
  before(:each) do
    assigns[:job_title] = @job_title = stub_model(JobTitle,
      :title => "value for title"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
  end
end
