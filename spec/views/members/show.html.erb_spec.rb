require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/members/show.html.erb" do
  include MembersHelper
  before(:each) do
    assigns[:member] = @member = stub_model(Member,
      :first => "value for first",
      :last => "value for last",
      :email => "value for email",
      :company => "value for company",
      :employed_type => "value for employed_type",
      :gender => "value for gender"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ first/)
    response.should have_text(/value\ for\ last/)
    response.should have_text(/value\ for\ email/)
    response.should have_text(/value\ for\ company/)
    response.should have_text(/value\ for\ employed_type/)
    response.should have_text(/value\ for\ gender/)
  end
end
