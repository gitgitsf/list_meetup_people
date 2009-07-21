require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/members/index.html.erb" do
  include MembersHelper

  before(:each) do
    assigns[:members] = [
      stub_model(Member,
        :first => "value for first",
        :last => "value for last",
        :email => "value for email",
        :company => "value for company",
        :employed_type => "value for employed_type",
        :gender => "value for gender"
      ),
      stub_model(Member,
        :first => "value for first",
        :last => "value for last",
        :email => "value for email",
        :company => "value for company",
        :employed_type => "value for employed_type",
        :gender => "value for gender"
      )
    ]
  end

  it "renders a list of members" do
    render
    response.should have_tag("tr>td", "value for first".to_s, 2)
    response.should have_tag("tr>td", "value for last".to_s, 2)
    response.should have_tag("tr>td", "value for email".to_s, 2)
    response.should have_tag("tr>td", "value for company".to_s, 2)
    response.should have_tag("tr>td", "value for employed_type".to_s, 2)
    response.should have_tag("tr>td", "value for gender".to_s, 2)
  end
end
