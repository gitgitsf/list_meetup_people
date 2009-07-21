require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/job_titles/edit.html.erb" do
  include JobTitlesHelper

  before(:each) do
    assigns[:job_title] = @job_title = stub_model(JobTitle,
      :new_record? => false,
      :title => "value for title"
    )
  end

  it "renders the edit job_title form" do
    render

    response.should have_tag("form[action=#{job_title_path(@job_title)}][method=post]") do
      with_tag('input#job_title_title[name=?]', "job_title[title]")
    end
  end
end
