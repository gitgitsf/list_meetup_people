require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/job_titles/new.html.erb" do
  include JobTitlesHelper

  before(:each) do
    assigns[:job_title] = stub_model(JobTitle,
      :new_record? => true,
      :title => "value for title"
    )
  end

  it "renders new job_title form" do
    render

    response.should have_tag("form[action=?][method=post]", job_titles_path) do
      with_tag("input#job_title_title[name=?]", "job_title[title]")
    end
  end
end
